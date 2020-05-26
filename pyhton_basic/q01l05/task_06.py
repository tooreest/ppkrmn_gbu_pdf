#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 6.
Необходимо создать (не программно) текстовый файл, где каждая строка описывает
учебный предмет и наличие лекционных, практических и лабораторных занятий
по этому предмету и их количество. Важно, чтобы для каждого предмета не
обязательно были все типы занятий. Сформировать словарь, содержащий название
предмета и общее количество занятий по нему. Вывести словарь на экран.
Примеры строк файла:

Информатика: 100(л) 50(пр) 20(лаб).
Физика: 30(л) — 10(лаб)
Физкультура: — 30(пр) —
Пример словаря:

{“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}

'''
from task_02 import freadlns

def fndnmb(str):
    result = '0'
    for i in str:
        if i.isdigit():
            result += i
    return result

def parsestr(str):
    lst = str.split()
    subj = lst.pop(0).replace(':', '')
    hours =0
    for i in lst:
        hours += int(fndnmb(i))
    return subj, hours


in_fname = 'in_task_06.txt'
content = freadlns(in_fname)
print(content)
result = {}
for i in content:
    key, val = parsestr(i)
    result[key] = val

print(result)
print('Bye!!!')
