import numpy as np

num = 0
count1 = 0
count2 = 0
l = []
l2 = []
l3 = []

while num != -1:
    num = int(input('정수를 입력하세요 종료=-1 :'))
    l.append(num)
    
    if(num == -1):
        for x in l:
            if x%2 == 0:
                l2.append(x)
                count1 += 1
            else:
                l3.append(x)
                count2 += 1
        if count1 > 0:
            print('짝수는 %d개 입니다.'%count1)
            print('짝수 : ',l2)
        if count2 > 0:
            print('홀수는 %d개 입니다.'%count2)
            print('홀수 : ',l3)
