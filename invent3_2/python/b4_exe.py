import sys
import csv
import time
from itertools import product
from mip import *

basename = sys.argv[1]
with open(basename+'.csv') as inp_f:
  reader = csv.reader(inp_f)
  data = [row for row in reader]

sizes = data.pop(0)
rows = int(sizes[0]) # 行数
cols = int(sizes[1]) # 列数

start_time = time.time() # 開始時間

# model
md = Model(name="Kakkuro_MIP")
md.verbose = 0 # 0:最適化状況を表示しない

# 変数
sol = [[[md.add_var('x_{}_{}_{}'.format(i,j,k), var_type='B') for k in range(9)] for j in range(cols)] for i in range(rows)]
# 制約
for y, x in product(range(rows), range(cols)):
  if '\\' in data[y][x]:
    former, latter = data[y][x].split('\\')
    if former:
      #この時yの値は/に遭遇した時点のものである
      rows_flag = 1 #rows_flag:データ探索のためにyからの行数をカウント。
      while(y + rows_flag < rows and not data[y+rows_flag][x]): 
        rows_flag += 1 #'/'に遭遇した時点からの選択可能なマスの数をカウント
      
      #同じ制約列上にある限り、同じ奥行きにある数字は選択できない(同じ数字が選択できない制約)
      for k in range(9):
        md += xsum((sol[y + i][x][k]) for i in range(1, rows_flag)) <= 1, 'cols1_' + str(y) + '_' + str(x) + '_' + str(k)
      
      md += xsum((sol[y + i][x][k] * (k+1)) for i in range(1, rows_flag) for k in range(9)) == int(former), 'cols2_' + str(y) + '_' + str(x)

    if latter:
      #この時xの値は/に遭遇した時点のものである
      cols_flag = 1 #rows_flag:データ探索のためにxからの行数をカウント。
      while (x + cols_flag < cols and not data[y][x+cols_flag]):
        cols_flag += 1 #'/'に遭遇した時点からの選択可能なマスの数をカウント

      #同じ制約行上にある限り、同じ奥行きにある数字は選択できない(同じ数字が選択できない制約)
      for k in range(9):
        md += xsum((sol[y][x + j][k]) for j in range(1, cols_flag)) <= 1, 'rows1_' + str(y) + '_' + str(x) + '_' + str(k)
      
      md += xsum((sol[y][x + j][k] * (k+1)) for j in range(1, cols_flag) for k in range(9)) == int(latter), 'rows2_' + str(y) + '_' + str(x)

  elif not data[y][x]:
      #数字が選択可能の時、一マスにつき複数の数字を選択できない制約
      md += xsum(sol[y][x][k] for k in range(9)) == 1, 'sol1_'+ str(y) + '_' + str(x)
  #黒いとき(x)は何もしないのでelseはなし
  #md.write("test.lp")

#最適化
status = md.optimize(max_seconds=600)

# dataに数字データを挿入
for y, x in product(range(rows), range(cols)):
  if not data[y][x]:
    for k in range(9):
      if (sol[y][x][k].x >= 0.99):
        data[y][x] = str(k+1)

data.insert(0, sizes)

with open(basename+'_sol.csv', 'w') as out_f:
  writer = csv.writer(out_f)
  writer.writerows(data)

elapsed_time = time.time() - start_time

print("Running time: {0}".format(elapsed_time)+" [sec]")