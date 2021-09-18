from PIL import Image
from PIL import ImageFilter
import matplotlib.pyplot as plt
import numpy as np
import cv2
import pandas as pd


import tensorflow as tf

tf.compat.v1.disable_eager_execution()


#####################data generated from an image##########################
img = Image.open('landscape.jpg')
plt.axis("off")
plt.imshow(img)

gray = img.convert('L')
plt.figure()
plt.imshow(gray, cmap='gray')
plt.axis('off')



image = cv2.imread("landscape.jpg")
 

image1 = img.resize((640,360))
 

# cv2.imshow("resize", image1)
# cv2.imshow("image", image)

r, g, b = image1.split()
input=np.array(r)
r.save("input.jpg")
np.array(g)
np.array(b)


plt.imshow(r, cmap='gray')
plt.axis('off')

print(np.array(img).shape)
print(input)

np.savetxt("input.txt", input,fmt='%x',delimiter='\n')


#######################convolution result####################################3

im_emboss=r.filter(ImageFilter.Kernel((3,3),(-1,0,0,0,2,0,0,0,0)))#EMBOSS)#
im_emboss.save("test_embross.jpg")
output=np.array(im_emboss)
np.savetxt("out.txt", output,fmt='%x',delimiter='\n')

plt.imshow(im_emboss, cmap='gray')



plt.imshow(r, cmap='gray')



##########################padding operation#################################################


input_data = input.reshape(1, 360, 640).astype(np.float32)
input_data =(input_data/2).astype(np.int8)

sess = tf.compat.v1.InteractiveSession()
padding = tf.pad(input_data.reshape(360,640),[[1,1],[1,1]])
b=sess.run(padding)
#print(b)

###########################write padding result to excel and txt#####################################
data = pd.DataFrame(b)
writer = pd.ExcelWriter('padding.xlsx')		# 写入Excel文件
data.to_excel(writer, 'page_1', float_format='%.5f')		# ‘page_1’是写入excel的sheet名
writer.save()
writer.close()

input_data =input_data.astype(np.float32)
np.savetxt("input.txt", input_data.reshape(360,640).astype(np.int8),fmt='%02x',delimiter='\n')
np.savetxt("real_padding.txt", b,fmt='%02x',delimiter='\n')
print(input_data.shape)

###########################convolution kernel######################################################
weights_data = np.array([[[4,16,28],
                        [8,20,32],
                        [12,24,36]]]).astype(np.float32)


def chw2hwc(chw_tensor):
    [c, h, w] = chw_tensor.shape
    cols = []
    for i in range(c):
        line = np.reshape(chw_tensor[i], [h*w, 1])
        cols.append(line)

    inputd = np.concatenate(cols, 1) # 25*2 如果是0轴的话，就是50*1
    inputd = np.reshape(inputd, [h, w, c])
    return inputd

def hwc2chw(tensor):
    [h, w, c] = tensor.shape
    cs = []
    for i in range(c):
        channel = np.expand_dims(tensor[:,:,i], 0) # 1*h*w
        #print(channel.shape)
        cs.append(channel)

    inputd = np.concatenate(cs)
    return inputd


print(input_data)
print(input_data.shape)
print(chw2hwc(input_data))
print(chw2hwc(input_data).shape)

def tensorflow_conv_example():

    input_data_fixed = chw2hwc(input_data)  # 2 5 5 > 5 5 2
    input_tensor = tf.Variable(input_data_fixed, tf.float32, name='input')
    input_tensor = tf.expand_dims(input_tensor, 0) # 5 5 2 > 1 5 5 2
    print("input_get_shape=",input_tensor.get_shape())

    weights_data_fixed = chw2hwc(weights_data) # 2 3 3 > 3 3 2
    input_weight = tf.Variable(weights_data_fixed, tf.float32, name='weight')
    input_weight = tf.expand_dims(input_weight, 3) # 3 3 2 > 3 3 2 1
    print("weight_get_shape",input_weight.get_shape())

    conv = tf.nn.conv2d(input_tensor, input_weight, strides=[1,1,1,1], padding='SAME')

    init = tf.compat.v1.global_variables_initializer()#tf.global_variables_initializer()
    sess = sess = tf.compat.v1.Session()#tf.Session()
    sess.run(init)
    conv_result = sess.run(conv)

    output=hwc2chw(conv_result[0]).reshape(input_data.shape[1],input_data.shape[2])
    print('input_tensor:',sess.run(input_tensor))
    # print(conv_result)
    print('tensorflow result:\n',output)
    print('tensorflow shape:\n',output.shape)

    return output



tensor_output=tensorflow_conv_example().astype(np.int32)





def conv_op(fm, kernel):
    """
    计算单个通道的卷积操作的函数，这里其实默认设置了padding为全补0， 步长为1的卷积
    :param fm:  输入数据的一层  [ h, w ]
    :param kernel:  卷积核的一层 [ k, k ]
    :return:
    """
    [h, w] = fm.shape
    [k, _] = kernel.shape
    r = int(k/2)  # 卷积核的半径，也就是卷积核覆盖的范围和视野
    print('fm.shape:', fm.shape, 'kernel.shape:',kernel.shape, 'r:',r)

    # 对数据周边做全0填充，这里对每个边缘都补充了1行或1列数量的0，加起来就是行和列都补充2
    # 这个数目主要是由stride 的数目决定的
    padding_fm = np.zeros([h+2, w+2], np.float32)
    rs = np.zeros([h, w], np.float32)
    padding_fm[1:h+1, 1:w+1] = fm

    # 每一个步长做卷积计算
    for i in range(1, h+1):
        for j in range(1, w+1):
            roi = padding_fm[i-r:i+r+1, j-r:j+r+1]  #
            rs[i-1][j-1] = np.sum(roi * kernel)

    return rs

def my_conv_example(input_tensor, weight):
    """
    自己计算卷积的示例，因为使用 batch_size 为 1，所以数据维度就只有3维了，
    并且不需要使用 chw > whc 的转换了
    :param input_tensor: 输入数据 [c,h,w]
    :param weight: 卷积核  [c,k,k]
    :return:
    """
    [c, h, w] = input_tensor.shape
    [_, k, _] = weight.shape
    output = np.zeros([h, w], np.float32)

    # 对每个通道的数据进行卷积操作，并将得到的结果累加求和
    for i in range(c):
        f_map = input_tensor[i] 
        w = weight[i]  # 每一层  feature map 对应一个卷积核
        rs = conv_op(f_map, w)
        output = output + rs

    return output


output=my_conv_example(input_data, weights_data).astype(np.int32)
print('my conv result:')
print(output)

print("my conv result shape:",output.shape)

np.savetxt("out.txt", output,fmt='%d',delimiter='\n')


##########################compare ################################################
output_list=output.tolist()
#file_list= np.loadtxt('file.txt').reshape(360,640)#np.genfromtxt("file.txt", dtype=np.i, delimiter="\n")
tensor_list=tensor_output.tolist()

for i in range(input.shape[1]):
    for j in range(input.shape[0]):
        if(tensor_list[i][j]!=output_list[i][j]):
            num=num+1
            print("order=",(i,j)," out_data=",output_list[i][j], "tensor_data=",tensor_list[i][j])
            if(num%1000==0):
                print("num=",num)


print("num=",num)

 


