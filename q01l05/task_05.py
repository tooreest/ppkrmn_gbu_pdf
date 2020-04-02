#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 5.
Создать (программно) текстовый файл, записать в него программно набор чисел,
разделенных пробелами. Программа должна подсчитывать сумму чисел в файле
и выводить ее на экран.

'''

from random import random


out_fname = 'task_05.txt'
numlist = [f'{random()*1000:.2f} ' for i in range(1,25)]

with open(out_fname, 'w', encoding='utf-8') as f:
    f .writelines(numlist)

with open(out_fname, 'r', encoding='utf-8') as f:
    content = f.read().split()
    print(f'File {out_fname} was writen.')
print(content)

summ = 0
for i in content:
    summ += float(i)
print(f'Sum of numbers from a file equal {summ:.2f}')
print('Bye!!!')
