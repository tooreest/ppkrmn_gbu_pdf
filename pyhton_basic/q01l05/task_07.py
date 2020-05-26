#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 7.
Создать (не программно) текстовый файл, в котором каждая строка должна
содержать данные о фирме: название, форма собственности, выручка, издержки.

Пример строки файла: firm_1 ООО 10000 5000.

Необходимо построчно прочитать файл, вычислить прибыль каждой компании,
а также среднюю прибыль. Если фирма получила убытки, в расчет средней
прибыли ее не включать.

Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями,
а также словарь со средней прибылью. Если фирма получила убытки,
также добавить ее в словарь (со значением убытков).

Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].

Итоговый список сохранить в виде json-объекта в соответствующий файл.

Пример json-объекта:

[{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]

Подсказка: использовать менеджеры контекста.

'''

from task_02 import freadlns
from json import dump

def parsefirm(str):
    return str.split()[0], float(str.split()[2]) - float(str.split()[3])


in_fname = 'in_task_07.txt'
out_fname = 'out_task_07.json'

content = freadlns(in_fname)
print(content)
firms_profit = {}
result = []
for i in content:
    name, profit = parsefirm(i)
    firms_profit[name] = round(profit, 2)
result.append(firms_profit)
n, s = 0, 0
for i in firms_profit.keys():
    if firms_profit[i] > 0:
        n += 1
        s += firms_profit[i]
aver = round(s / n, 2)
result.append({'average_profit': aver})
print(result)
with open(out_fname, 'w', encoding='utf-8') as f:
    dump(result, f, ensure_ascii=False, indent=4)
