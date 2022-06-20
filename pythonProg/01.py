import numpy as np

x1 = [ i for i in range(200) ]
x2 = [ i + np.random.randint(1, 25) for i in range(200) ]
x3 = [ i + np.random.randint(1, 75) for i in range(200)]
x4 = [ np.random.randint(1, 50) for i in range(200) ]

list = [x1,x2,x3,x4]

array = np.array(list)

print()
print('열평균')
print(np.mean(array, axis=0))

print('열 중앙값')
print(np.median(array,axis=1))

print('열 최대값')
print(np.argmax(array,axis=1))

print('열 최소값')
print(np.argmin(array, axis=1))
