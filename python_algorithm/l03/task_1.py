#!
"""
Geekbrains. Факультет python-разработки
Студент: Папко Роман.
Четверть 1. Алгоритмы и структуры данных на Python. Базовый курс
Урок 3. Хэш-функции.
Домашнее задание 1.
"""

"""
Задание 1.

Докажите, что словари обрабатываются быстрее, чем списки.

Реализуйте две функции, в первой нужно заполнить элементами список, во второй-словарь
Сделайте замеры времени выполнения каждой из функций.

Подсказка: для замеров воспользуйтесь модулем time (см. примеры урока 1)

Примечание: eсли вы уже знаете, что такое декоратор и как его реализовать,
то реализуйте ф-цию-декоратор и пусть она считает время
И примените ее к двум своим функциям.
"""

from random import randint as ri
from datetime import datetime as dt

def time_test(func):
    def wrap(*args, **kwargs):
        start_time = dt.today()
        
        func(*args, **kwargs)
        
        end_time = dt.today()
        working = end_time - start_time
        print(f'Функция {func.__name__} проработала {working} секунд')
    return wrap
    
@time_test   
def gen_list(num_of_elements):
    lst = [i for i in range(0, num_of_elements)]
    print(len(lst))
    for i in range(0, num_of_elements):
        lst.pop()
    print(lst)
    
@time_test 
def gen_dict(num_of_elements):
    dct = {i:i for i in range(0, num_of_elements)}
    print(len(dct))
    for i in range(0, num_of_elements):
        dct.pop(i)
    print(dct)


num_of_elems = 10000000
mylist = gen_list(num_of_elems)
mydict = gen_dict(num_of_elems)
