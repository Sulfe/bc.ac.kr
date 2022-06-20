from cProfile import label
import numpy as np
import matplotlib.pyplot as plt

x = np.random.randint(0,101,size=100)
y = np.random.randint(0,101,size=100)

list = [x,y]

array=np.array(list)
print(array)

plt.scatter(x,y)
plt.show()