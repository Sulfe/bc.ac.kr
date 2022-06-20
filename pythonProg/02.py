import pandas as pd

weather = pd.read_csv('weather.csv', index_col = 0, encoding = 'CP949')

x = weather [ weather['평균기온'].max() == weather['평균기온']]
y = weather [ weather['평균기온'].min() == weather['평균기온']]

x1 = weather['평균기온'].max()
x2 = weather['평균기온'].min()

y1 = x['평균풍속'].max()
y2 = y['평균풍속'].min()

z1 = x['최대풍속'].max()
z2 = y['최대풍속'].max()

print()
print(x)
print(y)
print("평균기온 차이 : ", x1 - x2)
print("평균풍속 차이 : ", y1 - y2)
print("최대풍속 차이 : ", z1 - z2)