#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 3. Функции
Домашнее задание 1.
Реализовать функцию, принимающую два числа (позиционные аргументы) и выполняющую их деление.
Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.

'''
def divis(a, b):
    """
    Функция принимает переменных типа string.
    
    Функция возвращает результат деления типа float, если строки можно преобразовать в тип float.
    
    Производится обработка исключений типа ZeroDivisionError и ValueError
    с возвратом соответствующего сообщения
    
    """
    try:
        return float(a) / float(b)
    except ZeroDivisionError:
        return f'Деление на ноль не допустимо.'
    except ValueError:
        return f'Тип делимого или делителя не верны.'

dd = input(f'Введите делимое: ')
dr = input(f'Введите делитель: ')
result = divis(dd, dr)
if str(result).replace('.', '').isdigit():
    print(f'{result:.2f}')
else:
    print(f'{result}')
