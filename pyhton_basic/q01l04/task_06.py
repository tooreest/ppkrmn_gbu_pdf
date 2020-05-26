#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 4. Функции
Домашнее задание 6.
Реализовать два небольших скрипта:
а) бесконечный итератор, генерирующий целые числа, начиная с указанного,
б) бесконечный итератор, повторяющий элементы некоторого списка, определенного заранее.
Подсказка: использовать функцию count() и cycle() модуля itertools.

'''

from itertools import count
from itertools import cycle


start = 3
end = 17
numlist = []
for i in count(start):
    if i < end:
        numlist.append(i)
    else:
        break

result = []
num_of_element = len(numlist)*3
for i in cycle(numlist):
    if num_of_element > 0:
        result.append(i)
        num_of_element -= 1
    else:
        break

print(f'Список чисел, сгенерированный с помощью count():\n{numlist}')
print(f'Список чисел, сгенерированный из первого с помощью cycle():\n{result}')
print('Bye!!!')
