#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 3. Функции
Домашнее задание 3.
Реализовать функцию my_func(), которая принимает три позиционных аргумента,
и возвращает сумму наибольших двух аргументов.

'''
def my_func(a,  b, c):
    sum = float(a) if float(a) > float(b) else float(b)
    sum += float(a) if float(a) > float(c) else float(c)
    return sum
''' С проверкой валидности ввода заморачиваться не стал. Задание не в этом. '''
print(my_func('27', '27.0001',  '26.99'))
print('Bye!!!')
