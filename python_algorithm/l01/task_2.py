"""
Задание 2.

Реализуйте два алгоритма.

Первый, в виде функции, должен обеспечивать поиск минимального значения для списка.
В основе алгоритма должно быть сравнение каждого числа со всеми другими элементами списка.
Сложность такого алгоритма: O(n^2) - квадратичная.

Второй, в виде функции, должен обеспечивать поиск минимального значения для списка.
Сложность такого алгоритма: O(n) - линейная.

Примечание:
Построить список можно через генератор списка.
Если у вас возникают сложности, постарайтесь подумать как можно решить задачу,
а не писать "мы это не проходили)".
Алгоритмизатор должен развивать мышление, а это прежде всего практика.
А без столкновения со сложностями его не развить.
"""
from random import randint


list_lenght = 30
start_random = -100
end_random = 100

def min_element_sq(lst):
    min_el = lst[0]
    for i in lst:
        for j in lst:
            if i < j:
                smaller = i
            else:
                smaller = j
            if smaller < min_el:
                min_el = smaller
    return min_el

def min_element_lin(lst):
    min_el = lst[0]
    for i in lst:
        if i < min_el:
            min_el = i
    return min_el


my_list = [randint(start_random, end_random) for _ in range(1, list_lenght + 1)]

print(my_list) 
print(min_element_sq(my_list))
print(min_element_lin(my_list)