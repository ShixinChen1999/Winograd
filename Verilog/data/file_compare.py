

def file_cmp_single_file (file0_name, file1_name) :
    ##### 文件比较
    # file0 = open("./python_test_2_int8_golden/layer_1_out_int8.txt", "r")
    # file0 = open("./python_test_2_int8_golden/python_test_2_golden_0716/layer_5_out_int8.txt", "r")

    # file0 = open("./FPGA_output_0707_no_pcin/FPGA_int8_layer1_out.txt", "r")

    # file0 = open("./FPGA_output_0701_1/FPGA_layer1_out.txt", "r")
    # file1 = open("./FPGA_output_0717/FPGA_int8_layer5_out.txt", "r")
    # file1 = open("./FPGA_output_0519_cmp/FPGA_output_last/FPGA_einsum_out.txt", "r")

    file0 = open(file0_name, "r") 
    file1 = open(file1_name, "r") 

    data0 = file0.readlines()
    data1 = file1.readlines()

    file0_len = len(data0)
    file1_len = len(data1)
    if file0_len != file1_len :
        print("file length not match!! \n")
        print("file 0:", file0_len, "file 1:", file1_len)
        quit()
    else :
        print("file length is: \n", file0_len)

    temp0 = []
    temp1 = []
    for D in data0:
        temp0.append(int(D.replace("\n", ""),16))

    for D in data1:
        temp1.append(int(D.replace("\n", ""),16))

    # for i in range(0,file0_len):

    #     if (temp0[i] > 127) :
    #         temp0[i] = temp0[i] - 256 
    #     if (temp1[i] > 127) :
    #         temp1[i] = temp1[i] - 256

    # for j in range (0,16) :
    #     error0 = 0
    #     error1 = 0
    #     error2 = 0
    #     error3 = 0
    #     error4 = 0
    #     error5 = 0
    #     error_of = 0
    #     sumn_err = 0
    #     print("======= channel num: ", j)

    #     for i in range(j*230400,(j+1)*230400):
    #         sumn_err = abs(temp0[i] - temp1[i]) + sumn_err

    #         if (abs(temp0[i] - temp1[i]) < 16) :
    #             error0 = error0 + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
    #         elif (abs(temp0[i] - temp1[i]) >= 16) and abs(temp0[i] - temp1[i]) < 32:
    #             error1 = error1 + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
    #         elif (abs(temp0[i] - temp1[i]) >= 32) and abs(temp0[i] - temp1[i]) < 64:
    #             error2 = error2 + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
    #         elif (abs(temp0[i] - temp1[i]) >= 64) and abs(temp0[i] - temp1[i]) < 128:
    #             error3 = error3 + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
    #         elif (abs(temp0[i] - temp1[i]) >= 128) and abs(temp0[i] - temp1[i]) < 256:
    #             error4 = error4 + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
    #         # elif (abs(temp0[i] - temp1[i]) > 65500):
    #         #     error_of = error_of + 1
    #         # elif (abs(temp0[i] - temp1[i]) > 250):
    #         #     error_of = error_of + 1
    #             # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])

    #         else :
    #             error5 = error5 + 1
    #             print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])

    #     err_rate = sumn_err/ 230400 / 256

    #     # print("the number for no error : %d       \n" % (error0))
    #     # print("the number for data error 1 = : %d  \n" % (error1))
    #     # print("the number for data error 2 =  : %d \n" % (error2))
    #     # print("the number for data error 3 =  : %d \n" % (error3))
    #     # print("the number for data error 4 =  : %d \n" % (error4))
    #     # print("the number for data error 5 =  : %d \n" % (error5))
    #     # print("the number for data error of =  : %d \n" % (error_of))

    #     print("Error Rate =  : %.6f \n" % (err_rate))

    error0 = 0
    error1 = 0
    error2 = 0
    error3 = 0
    error4 = 0
    error5 = 0
    error_of = 0
    sumn_err = 0

    for i in range(0,file0_len):
        sumn_err = abs(temp0[i] - temp1[i]) + sumn_err

        if (abs(temp0[i] - temp1[i]) < 2) :
            error0 = error0 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])
        elif (abs(temp0[i] - temp1[i]) >= 2) and abs(temp0[i] - temp1[i]) < 8:
            error1 = error1 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i], "channel: ", i/230400, 'line: ', (i%230400)/640)
        elif (abs(temp0[i] - temp1[i]) >= 8) and abs(temp0[i] - temp1[i]) < 32:
            error2 = error2 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i], "channel: ", i/230400, 'line: ', (i%230400)/640)
        elif (abs(temp0[i] - temp1[i]) >= 32) and abs(temp0[i] - temp1[i]) < 128:
            error3 = error3 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i], "channel: ", i/230400, 'line: ', (i%230400)/640)
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i], "row: ", i/1440, 'col: ', i%1440)

        elif (abs(temp0[i] - temp1[i]) >= 128) and abs(temp0[i] - temp1[i]) < 256:
            error4 = error4 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i], "channel: ", i/230400, 'line: ', (i%230400)/640)
        # elif (abs(temp0[i] - temp1[i]) > 65500):
        #     error_of = error_of + 1
        # elif (abs(temp0[i] - temp1[i]) > 250):
        #     error_of = error_of + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])

        else :
            error5 = error5 + 1
            # print("the %d data is : %d : %d \n",i, temp0[i],temp1[i])

    err_rate = sumn_err/ file0_len / 16777216

    print("the number for no error : %d        " % (error0))
    print("the number for data error 1 =  : %d " % (error1))
    print("the number for data error 2 =  : %d " % (error2))
    print("the number for data error 3 =  : %d " % (error3))
    print("the number for data error 4 =  : %d " % (error4))
    print("the number for data error 5 =  : %d " % (error5))
    print("the number for data error of = : %d \n" % (error_of))

    print("Total error =  : %.1f \n" % (sumn_err))
    print("Error Rate =  : %.6f \n" % (err_rate))

    file0.close()
    file1.close()


if __name__ == '__main__':

    golden_layer1  =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_1_out_int8.txt"
    golden_layer2  =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_2_out_int8.txt"
    golden_layer3  =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_3_out_int8.txt"
    golden_layer4a =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_4a_out_int8.txt"
    golden_layer4b =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_4b_out_int8.txt"
    golden_layer5  =  "./python_test_2_int8_golden/python_test_2_golden_0717/layer_5_out_int8.txt"
    golden_d2s     =  "./int8_layer_5_out_d2s.hex"

    golden_5x5     =  "./python_test_2_int8_golden/python_test_2_golden_0717/5x5_out_fix.txt"
    golden_einsum  =  "./python_test_2_int8_golden/python_test_2_golden_0717/einsum_out_int8_0722.txt"
    golden_wino    =  "D:/vivado/SRAM/out.txt"

    fpga_layer1  = "./FPGA_output_0722_1/FPGA_int8_layer1_out.txt"
    fpga_layer2  = "./FPGA_output_0722_1/FPGA_int8_layer2_out.txt"
    fpga_layer3  = "./FPGA_output_0722_1/FPGA_int8_layer3_out.txt"
    fpga_layer4a = "./FPGA_output_0722_1/FPGA_int8_layer4a_out.txt"
    fpga_layer4b = "./FPGA_output_0722_1/FPGA_int8_layer4b_out.txt"
    fpga_layer5  = "./FPGA_output_0722_1/FPGA_int8_layer5_out.txt"
    fpga_5x5     = "./FPGA_output_0722_1/FPGA_int8_5x5_out.txt"
    fpga_einsum  = "./FPGA_output_0722_3/FPGA_int8_einsum_out.txt"
    fpga_wino    = "D:/vivado/SRAM/file.txt"

    # print ('================== Layer 1 =================')
    # file_cmp_single_file(golden_layer1 , fpga_layer1 )

    # print ('================== Layer 2 =================')
    # file_cmp_single_file(golden_layer2 , fpga_layer2 )

    # print ('================== Layer 3 =================')
    # file_cmp_single_file(golden_layer3 , fpga_layer3 )

    # print ('================== Layer 4a =================')
    # file_cmp_single_file(golden_layer4a, fpga_layer4a)

    # print ('================== Layer 4b =================')
    # file_cmp_single_file(golden_layer4b, fpga_layer4b)

    # print ('================== Layer 5 =================')
    # file_cmp_single_file(golden_layer5 , fpga_layer5 )
    # file_cmp_single_file(golden_d2s , fpga_layer5 )

    # print ('================== 5x5 =================')
    # file_cmp_single_file(golden_5x5 , fpga_5x5 )

    #print ('================== Einsum =================')
    # file_cmp_single_file(golden_einsum , fpga_einsum )

    #golden_einsum_1 = './data_cmp_729/einsum_out_0729.txt'
    #fpga_einsum_1  = "./data_cmp_729/FPGA_int8_einsum_out_0729.txt"
    #file_cmp_single_file(golden_einsum_1 , fpga_einsum_1)

    print ('================== Winograd =================')
    file_cmp_single_file(golden_wino , fpga_wino )
