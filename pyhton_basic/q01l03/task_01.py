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
print('Bye!!!')
