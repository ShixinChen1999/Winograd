import numpy as np
import os
import torch
import sys
import time 
import argparse
import tensorflow as tf
import pathlib
from tensorflow.keras.layers import Input
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Flatten
from tensorflow.keras.layers import MaxPooling2D
from tensorflow.keras.layers import UpSampling2D
from tensorflow.python.framework.convert_to_constants import convert_variables_to_constants_v2
log2 = np.log(2).astype(np.float32)

def pytorch_weights_to_tf_weights(weight_dict):
    '''
    Converts pytorch weight format to tensorflow weight format, as pytorch
    uses (num, channels, height, width) format while tensorflow uses (num, height, width, channels)
    '''
    tf_weight_dict = {}
    for name, weight in weight_dict.items():
        weight = weight.to('cpu').data.numpy() # convert to numpy array
        if weight.ndim == 4: # check that this is a convolutional layer
            # TODO: Differentiate between conv and depthwise conv
            weight = weight.transpose(2, 3, 1, 0)
            tf_weight_dict[name] = weight
        elif weight.ndim == 2: # this is a linear layer
            if 'anchor_generator' in name:
                tf_weight_dict[name] = weight
            else:
                weight = weight.transpose(1, 0)
                tf_weight_dict[name] = weight
        else:
            tf_weight_dict[name] = weight
    return tf_weight_dict

def Video_Net(weight, height, width):
    def conv_bn_module(x, K, kX, kY, stride, padding="same", RELU=False, weight=weight, weight_name=""):
        # define a CONV => BN => RELU pattern
        if padding=="same":
            x = tf.pad(x, [[0, 0], [1, 1], [1, 1], [0, 0]])
        conv_size = weight[weight_name+'.weight'].transpose(3,2,0,1).shape
        w_conv = np.reshape(weight[weight_name+'.weight'].transpose(3,2,0,1), (K, -1))
        w_bn = np.diag(weight[weight_name+'.norm.weight']/(np.sqrt(1e-5 + weight[weight_name+'.norm.running_var'])))
        new_conv = np.reshape(np.matmul(w_bn, w_conv),conv_size).transpose(2,3,1,0)
        b_conv = np.zeros(conv_size[0])
        b_conv = np.reshape(np.matmul(w_bn, np.reshape(b_conv, (K,1))),(-1))
        b_bn = weight[weight_name+'.norm.bias'] - np.multiply(weight[weight_name+'.norm.weight'],weight[weight_name+'.norm.running_mean'])/(np.sqrt(weight[weight_name+'.norm.running_var'] + 1e-5))
        new_bias = b_conv + b_bn
        x = tf.nn.conv2d(x, tf.constant(new_conv), [1, stride[0],stride[1],1], padding="VALID")
        x = tf.add(x, tf.constant(new_bias,dtype=tf.float32))
        if RELU:
            x = tf.nn.relu(x)
        return x


    def fpn_conv_module(x, K, kX, kY, stride, padding="same", RELU=False, weight_conv=None,weight_bias=None):
        # define a CONV => BN => RELU pattern
        if padding=="same":
            x = tf.pad(x, [[0, 0], [1, 1], [1, 1], [0, 0]])
        x = tf.nn.conv2d(x, tf.constant(weight_conv), [1, stride[0],stride[1],1], padding="VALID")
        x = tf.add(x,tf.constant(weight_bias))
        if RELU:
            x = tf.nn.relu(x)
        return x

	# initialize the input shape to be "channels last" and the
	# channels dimension itself
    inputShape = (height, width, 3)

    inputs = Input(shape=inputShape,dtype=tf.float32)
    a = tf.pad(inputs, [[0, 0], [3, 3], [3, 3], [0, 0]])
    a = conv_bn_module(a, 64, 7, 7, (2, 2),padding="valid",RELU=True, weight=weight, weight_name='backbone.bottom_up.stem.conv1')

    a = tf.pad(a, [[0, 0], [1, 1], [1, 1], [0, 0]])
    a = MaxPooling2D(pool_size=(3, 3), strides=(2, 2), padding="valid")(a)
    ###basic_block 2
    b1 = conv_bn_module(a, 64, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res2.0.conv1')
    b1 = conv_bn_module(b1, 64, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res2.0.conv2')
    
    b = tf.add(a, b1)
    b = tf.nn.relu(b)


    c1 = conv_bn_module(b, 64, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res2.1.conv1')
    c1 = conv_bn_module(c1, 64, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res2.1.conv2')
    c11 = tf.add(b,c1)
    c11 = tf.nn.relu(c11)

    c2 = conv_bn_module(c11, 64, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res2.2.conv1')
    c2 = conv_bn_module(c2, 64, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res2.2.conv2')
    c = tf.add(c11,c2)
    c = tf.nn.relu(c)
    ###basic_block 3
    d1 = conv_bn_module(c, 128, 3, 3, (2, 2), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res3.0.conv1')
    d1 = conv_bn_module(d1, 128, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res3.0.conv2')
    d2 = conv_bn_module(c, 128, 1, 1, (2, 2), padding="valid", RELU=False,weight=weight,weight_name='backbone.bottom_up.res3.0.shortcut')

    d = tf.add(d2,d1)
    d = tf.nn.relu(d)

    e1 = conv_bn_module(d, 128, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res3.1.conv1')
    e1 = conv_bn_module(e1, 128, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res3.1.conv2')
    e11 = tf.add(e1,d)
    e11 = tf.nn.relu(e11)
    
    e12 = conv_bn_module(e11, 128, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res3.2.conv1')
    e13 = conv_bn_module(e12, 128, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res3.2.conv2')
    e13 = tf.add(e13,e11)
    e13 = tf.nn.relu(e13)

    e14 = conv_bn_module(e13, 128, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res3.3.conv1')
    e15 = conv_bn_module(e14, 128, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res3.3.conv2')
    e = tf.add(e15,e13)
    e = tf.nn.relu(e)
    ###basic_block 4
    f1 = conv_bn_module(e, 256, 3, 3, (2, 2), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.0.conv1')
    f1 = conv_bn_module(f1, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.0.conv2')
    f2 = conv_bn_module(e, 256, 1, 1, (2, 2), padding="valid", RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.0.shortcut')

    f = tf.add(f2,f1)
    f = tf.nn.relu(f)

    g1 = conv_bn_module(f, 256, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.1.conv1')
    g1 = conv_bn_module(g1, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.1.conv2')
    g11 = tf.add(g1,f)
    g11 = tf.nn.relu(g11)


    g12 = conv_bn_module(g11, 256, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.2.conv1')
    g13 = conv_bn_module(g12, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.2.conv2')
    g13 = tf.add(g13,g11)
    g13 = tf.nn.relu(g13)


    g14 = conv_bn_module(g13, 256, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.3.conv1')
    g15 = conv_bn_module(g14, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.3.conv2')
    g15 = tf.add(g15,g13)
    g15 = tf.nn.relu(g15)

    g16 = conv_bn_module(g15, 256, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.4.conv1')
    g17 = conv_bn_module(g16, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.4.conv2')
    g17 = tf.add(g17,g15)
    g17 = tf.nn.relu(g17)

    g18 = conv_bn_module(g17, 256, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res4.5.conv1')
    g19 = conv_bn_module(g18, 256, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res4.5.conv2')
    g = tf.add(g19,g17)
    g = tf.nn.relu(g)

    ###basic_block 5
    h1 = conv_bn_module(g, 512, 3, 3, (2, 2), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res5.0.conv1')
    h1 = conv_bn_module(h1, 512, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res5.0.conv2')
    h2 = conv_bn_module(g, 512, 1, 1, (2, 2), padding="valid", RELU=False,weight=weight,weight_name='backbone.bottom_up.res5.0.shortcut')

    h = tf.add(h2,h1)
    h = tf.nn.relu(h)

    i1 = conv_bn_module(h, 512, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res5.1.conv1')
    i1 = conv_bn_module(i1, 512, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res5.1.conv2')
    i11 = tf.add(i1,h)
    i11 = tf.nn.relu(i11)

    i12 = conv_bn_module(i11, 512, 3, 3, (1, 1), padding="same",RELU=True,weight=weight,weight_name='backbone.bottom_up.res5.2.conv1')
    i13 = conv_bn_module(i12, 512, 3, 3, (1, 1), padding="same",RELU=False,weight=weight,weight_name='backbone.bottom_up.res5.2.conv2')
    i = tf.add(i13,i11)
    i = tf.nn.relu(i)
    
    p = fpn_conv_module(i, 128, 1, 1, (1, 1), padding="valid", RELU=False,weight_conv=weight['backbone.fpn_lateral5.weight'],weight_bias=weight['backbone.fpn_lateral5.bias'])
    #p for resize
    y2 = fpn_conv_module(p, 128, 3, 3, (1, 1), padding="same", RELU=False,weight_conv=weight['backbone.fpn_output5.weight'],weight_bias=weight['backbone.fpn_output5.bias'])
    y1 = MaxPooling2D(pool_size=(1, 1), strides=(2, 2), padding="valid")(y2)

    q1 = UpSampling2D(size=(2, 2), interpolation="nearest")(p)
    q2 = fpn_conv_module(g, 128, 1, 1, (1, 1), padding="valid", RELU=False,weight_conv=weight['backbone.fpn_lateral4.weight'],weight_bias=weight['backbone.fpn_lateral4.bias'])
    q = tf.add(q1,q2)

    y3 = fpn_conv_module(q, 128, 3, 3, (1, 1), padding="same", RELU=False,weight_conv=weight['backbone.fpn_output4.weight'],weight_bias=weight['backbone.fpn_output4.bias'])

    r1 = UpSampling2D(size=(2, 2), interpolation="nearest")(q)
    r2 = fpn_conv_module(e, 128, 1, 1, (1, 1), padding="valid", RELU=False,weight_conv=weight['backbone.fpn_lateral3.weight'],weight_bias=weight['backbone.fpn_lateral3.bias'])
    r = tf.add(r1,r2)

    y4 = fpn_conv_module(r, 128, 3, 3, (1, 1), padding="same", RELU=False,weight_conv=weight['backbone.fpn_output3.weight'],weight_bias=weight['backbone.fpn_output3.bias'])

    s1 = UpSampling2D(size=(2, 2), interpolation="nearest")(r)
    s2 = fpn_conv_module(c, 128, 1, 1, (1, 1), padding="valid", RELU=False,weight_conv=weight['backbone.fpn_lateral2.weight'],weight_bias=weight['backbone.fpn_lateral2.bias'])
    s = tf.add(s1,s2)
    y5 = fpn_conv_module(s, 128, 3, 3, (1, 1), padding="same", RELU=False,weight_conv=weight['backbone.fpn_output2.weight'],weight_bias=weight['backbone.fpn_output2.bias'])
    # # create the model
    ####RPN heads
    rpn2 = fpn_conv_module(y5, 128, 3, 3, (1, 1), padding="same", RELU=True, weight_conv=weight['proposal_generator.rpn_head.conv.weight'],weight_bias=weight['proposal_generator.rpn_head.conv.bias'])
    rpn3 = fpn_conv_module(y4, 128, 3, 3, (1, 1), padding="same", RELU=True, weight_conv=weight['proposal_generator.rpn_head.conv.weight'],weight_bias=weight['proposal_generator.rpn_head.conv.bias'])
    rpn4 = fpn_conv_module(y3, 128, 3, 3, (1, 1), padding="same", RELU=True, weight_conv=weight['proposal_generator.rpn_head.conv.weight'],weight_bias=weight['proposal_generator.rpn_head.conv.bias'])
    rpn5 = fpn_conv_module(y2, 128, 3, 3, (1, 1), padding="same", RELU=True, weight_conv=weight['proposal_generator.rpn_head.conv.weight'],weight_bias=weight['proposal_generator.rpn_head.conv.bias'])
    with tf.name_scope('classes'):
        cls_2 = fpn_conv_module(rpn2, 6, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.objectness_logits.weight'],weight_bias=weight['proposal_generator.rpn_head.objectness_logits.bias'])
        cls_2 = tf.reshape(cls_2, [tf.shape(cls_2)[0], -1, 1])
        cls_3 = fpn_conv_module(rpn3, 6, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.objectness_logits.weight'],weight_bias=weight['proposal_generator.rpn_head.objectness_logits.bias'])
        cls_3 = tf.reshape(cls_3, [tf.shape(cls_3)[0], -1, 1])
        cls_4 = fpn_conv_module(rpn4, 6, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.objectness_logits.weight'],weight_bias=weight['proposal_generator.rpn_head.objectness_logits.bias'])
        cls_4 = tf.reshape(cls_4, [tf.shape(cls_4)[0], -1, 1])
        cls_5 = fpn_conv_module(rpn5, 6, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.objectness_logits.weight'],weight_bias=weight['proposal_generator.rpn_head.objectness_logits.bias'])
        cls_5 = tf.reshape(cls_5, [tf.shape(cls_5)[0], -1, 1])
    with tf.name_scope('deltas'):
        delta2 = fpn_conv_module(rpn2, 24, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.anchor_deltas.weight'],weight_bias=weight['proposal_generator.rpn_head.anchor_deltas.bias'])
        delta2 = tf.reshape(delta2, [tf.shape(delta2)[0], -1, 4])
        delta3 = fpn_conv_module(rpn3, 24, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.anchor_deltas.weight'],weight_bias=weight['proposal_generator.rpn_head.anchor_deltas.bias'])
        delta3 = tf.reshape(delta3, [tf.shape(delta3)[0], -1, 4])
        delta4 = fpn_conv_module(rpn4, 24, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.anchor_deltas.weight'],weight_bias=weight['proposal_generator.rpn_head.anchor_deltas.bias'])
        delta4 = tf.reshape(delta4, [tf.shape(delta4)[0], -1, 4])
        delta5 = fpn_conv_module(rpn5, 24, 1, 1, (1, 1), padding="valid", RELU=False, weight_conv=weight['proposal_generator.rpn_head.anchor_deltas.weight'],weight_bias=weight['proposal_generator.rpn_head.anchor_deltas.bias'])
        delta5 = tf.reshape(delta5, [tf.shape(delta5)[0], -1, 4])
    model = Model(inputs, [(inputs, y2, y3, y4, y5),(cls_2,cls_3,cls_4,cls_5),(delta2,delta3,delta4,delta5)], name="bianjing_backbone_and_rpn")
    print('------------------'+inputs.name+'------------------------------------------')
    print(inputs.shape)
    print('------------------'+y2.name+'------------------------------------------')
    print(y2.shape)
    print('------------------'+y3.name+'------------------------------------------')
    print(y3.shape)
    print('------------------'+y4.name+'------------------------------------------')
    print(y4.shape)
    print('------------------'+y5.name+'------------------------------------------')
    print(y5.shape)
    print('------------------'+cls_2.name+'------------------------------------------')
    print(cls_2.shape)
    print('------------------'+cls_3.name+'------------------------------------------')
    print(cls_3.shape)
    print('------------------'+cls_4.name+'------------------------------------------')
    print(cls_4.shape)
    print('------------------'+cls_5.name+'------------------------------------------')
    print(cls_5.shape)
    print('------------------'+delta2.name+'------------------------------------------')
    print(delta2.shape)
    print('------------------'+delta3.name+'------------------------------------------')
    print(delta3.shape)
    print('------------------'+delta4.name+'------------------------------------------')
    print(delta4.shape)
    print('------------------'+delta5.name+'------------------------------------------')
    print(delta5.shape)
    tensor_shape = np.zeros(shape=(4,3),dtype='int')
    tensor_shape[0][0] = y5.shape[1]
    tensor_shape[0][1] = y5.shape[2]
    tensor_shape[0][2] = y5.shape[3]
    tensor_shape[1][0] = y4.shape[1]
    tensor_shape[1][1] = y4.shape[2]
    tensor_shape[1][2] = y4.shape[3]
    tensor_shape[2][0] = y3.shape[1]
    tensor_shape[2][1] = y3.shape[2]
    tensor_shape[2][2] = y3.shape[3]
    tensor_shape[3][0] = y2.shape[1]
    tensor_shape[3][1] = y2.shape[2]
    tensor_shape[3][2] = y2.shape[3]
    print(tensor_shape)
    np.save('./tensor_shape.npy', tensor_shape)
    return model


def Boxhead_Net(weight, tensor_shape, height, width):
    rois = Input(shape=(1, 200, 4),batch_size=1)
    p2 = Input(shape=(tensor_shape[0][0], tensor_shape[0][1], tensor_shape[0][2]),batch_size=1)
    p3 = Input(shape=(tensor_shape[1][0], tensor_shape[1][1], tensor_shape[1][2]),batch_size=1)
    p4 = Input(shape=(tensor_shape[2][0], tensor_shape[2][1], tensor_shape[2][2]),batch_size=1)
    p5 = Input(shape=(tensor_shape[3][0], tensor_shape[3][1], tensor_shape[3][2]),batch_size=1)
    
    roi_s = tf.squeeze(rois)
    x1, y1, x2, y2 = tf.split(roi_s, 4, axis=1)
    h = y2 - y1
    w = x2 - x1
    rois_c = tf.concat([y1/float(height-1),x1/float(width-1),y2/float(height-1),x2/float(width-1)],axis =-1)
    roi_level = tf.cast(tf.math.log(
        tf.sqrt((h * w)) / 224.0 + 1e-8) / tf.constant(log2),tf.float32)
    roi_level = tf.clip_by_value(roi_level, clip_value_min= 2, clip_value_max = 4)
    feature_map_list = [p2,p3,p4,p5]
    pooled_rois = []
    for i, level in enumerate(range(2, 6)):
        level_row = tf.cast(tf.squeeze(tf.equal(roi_level, tf.ones_like(roi_level)*level)),tf.float32) 
        level_row_ng = level_row - 1 
        level_rois = tf.stack([level_row,level_row,level_row,level_row],axis=1) * rois_c + tf.stack([level_row_ng,level_row_ng,level_row_ng,level_row_ng],axis=1)
        ret = tf.image.crop_and_resize(feature_map_list[i], level_rois, tf.zeros((200),dtype=tf.int32), (7,7), method="bilinear")
        pooled_rois.append(ret)
    pooled_rois = tf.add_n(pooled_rois)
    ##roi_box
    inputs_trans = tf.transpose(pooled_rois,perm=[0,3,1,2])
    inputs_flat = tf.reshape(inputs_trans, [tf.shape(inputs_trans)[0], -1])
    a = tf.add(tf.matmul(inputs_flat, tf.constant(weight['roi_heads.box_head.fc1.weight'])), tf.constant(weight['roi_heads.box_head.fc1.bias']))
    b = tf.nn.relu(a)
    # b = tf.add(tf.matmul(a, tf.constant(weight['roi_heads.box_head.fc2.weight'])), tf.constant(weight['roi_heads.box_head.fc2.bias']))
    # b = tf.nn.relu(b)
    c = tf.add(tf.matmul(b, tf.constant(weight['roi_heads.box_predictor.cls_score.weight'])), tf.constant(weight['roi_heads.box_predictor.cls_score.bias']))
    c = tf.nn.softmax(c)
    d = tf.add(tf.matmul(b, tf.constant(weight['roi_heads.box_predictor.bbox_pred.weight'])), tf.constant(weight['roi_heads.box_predictor.bbox_pred.bias']))
    model = Model(inputs=[rois,p2,p3,p4,p5], outputs=[pooled_rois, c, d], name="bianjing_roialign")
    print('------------------'+pooled_rois.name+'------------------------------------------')
    print(pooled_rois.shape)
    print('------------------'+c.name+'------------------------------------------')
    print(c.shape)
    print('------------------'+d.name+'------------------------------------------')
    print(d.shape)
    return model

   
def CropAndResize_Net(weight,tensor_shape):
    image = Input(shape=(tensor_shape[0][0], tensor_shape[0][1], tensor_shape[0][2]),batch_size=1)
    boxes = Input(shape=(1,52,4),batch_size=1)
    boxes_tmp = tf.squeeze(boxes)
    out = tf.image.crop_and_resize(image,boxes_tmp,tf.zeros((52),dtype=tf.int32),(7,7))
    model = Model(inputs=[image,boxes],outputs=[out])
    return model

def generate_aipp_cfg(camera_width, camera_height):
    temp = float(camera_width) * 512.0 / camera_height
    model_width =  int((temp-1)/32.0) * 32 + 32
    config_width = int((temp-1)/16.0) * 16 + 16
    padding_size = model_width - config_width
    print(model_width)
    print(config_width)
    file_to_rm = pathlib.Path('./aipp.cfg')
    if file_to_rm.exists():
        file_to_rm.unlink()
    file = open('./aipp.cfg','a')
    config1 = 'aipp_op {\n \
    aipp_mode: static\n \
    input_format : YUV420SP_U8\n'
    
    config2 = '     src_image_size_w: {}\n \
    src_image_size_h: {}\n'.format(config_width, 512)
    config3 = '     csc_switch : true\n \
    rbuv_swap_switch : false\n \
    matrix_r0c0 : 256\n \
    matrix_r0c1 : 475\n \
    matrix_r0c2 : 0\n \
    matrix_r1c0 : 256\n \
    matrix_r1c1 : -48\n \
    matrix_r1c2 : -120\n \
    matrix_r2c0 : 256\n \
    matrix_r2c1 : 0\n \
    matrix_r2c2 : 403\n \
    input_bias_0 : 0\n \
    input_bias_1 : 128\n \
    input_bias_2 : 128\n \
    min_chn_0 : 103.53\n \
    min_chn_1 : 116.28\n \
    min_chn_2 : 123.675\n \
    var_reci_chn_0 : 0.01743\n \
    var_reci_chn_1 : 0.01751\n \
    var_reci_chn_2 : 0.01712\n \
    padding : true\n'
    config4 = '     right_padding_size: {}\n'.format(padding_size)
    file.write(config1)
    file.write(config2)
    file.write(config3)
    file.write(config4)
    file.write('}')
    file.close()
    return model_width
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', default="", help='User must provide the network model file')
    parser.add_argument('--height', default="320", help="User must specify the camera input height")
    parser.add_argument('--width', default="640", help="User must specify the camera input width")
    args = parser.parse_args()
    model_width = generate_aipp_cfg(1920, 1080)
    dic = torch.load(args.model)
    weight = pytorch_weights_to_tf_weights(dic['model']) 
    model_backbone = Video_Net(weight=weight, height=512, width=model_width)
    full_model_backbone = tf.function(lambda x: model_backbone(x))
    full_model_backbone = full_model_backbone.get_concrete_function(tf.TensorSpec((1,512, model_width, 3), model_backbone.inputs[0].dtype))
    model_backbone = convert_variables_to_constants_v2(full_model_backbone)
    model_backbone.graph.as_graph_def()
    # Save frozen graph from frozen ConcreteFunction to hard drive
    tf.io.write_graph(graph_or_graph_def=model_backbone.graph,
                        logdir='tf_models',
                        name="backbone.pb",
                        as_text=False)
    tensor_shape = np.load('./tensor_shape.npy')
    model = Boxhead_Net(weight=weight, tensor_shape=tensor_shape, height=512, width=model_width)
    full_model = tf.function(lambda x: model(x))
    full_model = full_model.get_concrete_function(
        [tf.TensorSpec(shape=[1, 1, 200, 4],dtype=tf.float32),
        tf.TensorSpec(shape=[1, tensor_shape[0][0], tensor_shape[0][1], tensor_shape[0][2]],dtype=tf.float32),
        tf.TensorSpec(shape=[1, tensor_shape[1][0], tensor_shape[1][1], tensor_shape[1][2]],dtype=tf.float32),
        tf.TensorSpec(shape=[1, tensor_shape[2][0], tensor_shape[2][1], tensor_shape[2][2]],dtype=tf.float32), 
        tf.TensorSpec(shape=[1, tensor_shape[3][0], tensor_shape[3][1], tensor_shape[3][2]],dtype=tf.float32)]
        )
    frozen_func = convert_variables_to_constants_v2(full_model)
    frozen_func.graph.as_graph_def()
    # Save frozen graph from frozen ConcreteFunction to hard drive
    tf.io.write_graph(graph_or_graph_def=frozen_func.graph,
                        logdir='tf_models',
                        name="box.pb",
                        as_text=False)

    model_car = CropAndResize_Net(weight=weight, tensor_shape=tensor_shape)
    full_model = tf.function(lambda x: model_car(x))
    full_model = full_model.get_concrete_function(
        [tf.TensorSpec(shape=[1, tensor_shape[0][0], tensor_shape[0][1], tensor_shape[0][2]],dtype=tf.float32),
        tf.TensorSpec(shape=[1,   1,   52,   4],dtype=tf.float32)]
        )
    frozen_func = convert_variables_to_constants_v2(full_model)
    frozen_func.graph.as_graph_def()
    # Save frozen graph from frozen ConcreteFunction to hard drive
    tf.io.write_graph(graph_or_graph_def=frozen_func.graph,
                        logdir='tf_models',
                        name="car.pb",
                        as_text=False)
    if os.path.isdir('./om_models') == False:
        os.system('mkdir om_models')
    
    
    
    run_backbone = 'atc --output_type=FP32 \
                --model=./tf_models/backbone.pb \
                --framework=3 \
                -output=./om_models/backbone \
                --soc_version=Ascend310 \
                --log info \
                --insert_op_conf=./aipp.cfg'
    
    run_box = 'atc --output_type=FP32 --input_shape="x_4:1,{},{},{};x_3:1,{},{},{};x_2:1,{},{},{};x_1:1,{},{},{};x:1,1,200,4" \
               --model=./tf_models/box.pb \
               --framework=3 \
               --output=./om_models/box \
               --soc_version=Ascend310 \
               --log info'.format(tensor_shape[3][0],tensor_shape[3][1],tensor_shape[3][2],
                                  tensor_shape[2][0],tensor_shape[2][1],tensor_shape[2][2],
                                  tensor_shape[1][0],tensor_shape[1][1],tensor_shape[1][2],
                                  tensor_shape[0][0],tensor_shape[0][1],tensor_shape[0][2])
    run_car = 'atc --output_type=FP32 --input_shape="x:1,{},{},{};x_1:1,1,52,4" \
               --model=./tf_models/car.pb \
               --framework=3 \
               --output=./om_models/car \
               --soc_version=Ascend310 \
               --log info'.format(tensor_shape[0][0],tensor_shape[0][1],tensor_shape[0][2])
    os.system(run_backbone)
    os.system(run_box)
    os.system(run_car)         
    
