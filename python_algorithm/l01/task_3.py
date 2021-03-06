#!+
"""
Geekbrains. Факультет python-разработки
Студент: Папко Роман.
Четверть 1. Алгоритмы и структуры данных на Python. Базовый курс
Урок 1. Введение в алгоритмизацию и реализация простых алгоритмов на Python
Домашнее задание 3.
"""

"""
Задание 3.

Для этой задачи:
1) придумайте 1-3 решения (желательно хотя бы два)
2) оцените сложность каждого решения в нотации О-большое
3) сделайте вывод, какое решение эффективнее и почему

Примечание:
Без выполнения пунктов 2 и 3 задание считается нерешенным. Пункты 2 и 3 можно выполнить
через строки документации в самом коде.
Если у вас возникают сложности, постарайтесь подумать как можно решить задачу,
а не писать "мы это не проходили)".
Алгоритмизатор должен развивать мышление, а это прежде всего практика.
А без столкновения со сложностями его не развить.


Сама задача:
Имеется хранилище с информацией о компаниях: название и годовая прибыль.
Для реализации хранилища можно применить любой подход,
который вы придумаете, например, реализовать словарь.
Реализуйте поиск трех компаний с наибольшей годовой прибылью.
Выведите результат.
"""

from random import randint
companies = {
            'a':round(randint(10**5, 10**7) * 0.01, 2),
            'b':round(randint(10**5, 10**7) * 0.01, 2),
            'c':round(randint(10**5, 10**7) * 0.01, 2),
            'd':round(randint(10**5, 10**7) * 0.01, 2),
            'z':round(randint(10**5, 10**7) * 0.01, 2),
            'k':round(randint(10**5, 10**7) * 0.01, 2),
            'f':round(randint(10**5, 10**7) * 0.01, 2),
            'r':round(randint(10**5, 10**7) * 0.01, 2)
            }
print(companies)

def three_max_sq(dic):  # !!! O(n**2) - Вложенные циклы, квадратичная сложность (
    while len(dic) > 3:
        minimum = min(dic.values())
        for k,v in dic.items():
            if v == minimum:
                remel = k
        del dic[remel]      
    return dic

def three_max_lin(dic):  # !!! O(n) - линейный алгоритм (лучший вариант)
    result = {}
    key_list = list(dic.keys())
    val_list = list(dic.values())
    while len(result) < 3:
        idx_max = val_list.index(max(val_list))
        result[key_list.pop(idx_max)] = val_list.pop(idx_max)
    return result

print(three_max_lin(companies.copy()))
print(three_max_sq(companies.copy()))
