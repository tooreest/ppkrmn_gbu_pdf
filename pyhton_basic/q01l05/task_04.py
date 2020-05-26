#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 4.
Создать (не программно) текстовый файл со следующим содержимым:
One — 1
Two — 2
Three — 3
Four — 4
Необходимо написать программу, открывающую файл на чтение и считывающую
построчно данные. При этом английские числительные должны заменяться на русские.
Новый блок строк должен записываться в новый текстовый файл.

'''
from task_02 import freadlns

def fwrite(lst, fn):
    with open(fn, 'w') as f:
        f.writelines(lst)
        print(f'Файл {fn} записан.')

def translate(str):
    dict = {
                'one': 'один',
                'two': 'два',
                'three': 'три',
                'four': 'четыре',
                'five': 'пять',
                'six':'шесть',
                'seven': 'семь',
                'eight': 'восемь',
                'nine': 'девять',
                'ten': 'десять'
                }
    return dict[str.lower()].title()

in_fname = 'in_task_04.txt'
out_fname = 'out_task_04.txt'
content = freadlns(in_fname)
if not isinstance(content, list):
    print(content)
else:
    wrlst = []
    for i in content:
        s = i.split()
        wrlst.append(' '.join([translate(s[0]), s[1], s[2]+'\n']))
    fwrite(wrlst, out_fname)

print('Bye!!!')
