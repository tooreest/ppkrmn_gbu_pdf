#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 8. ООП. Полезные дополнения.
Домашнее задание 2.
Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль.
Проверьте его работу на данных, вводимых пользователем. При вводе пользователем
нуля в качестве делителя программа должна корректно обработать эту ситуацию
и не завершиться с ошибкой.

'''

class DivZError(Exception):
    def __init__(self, txt):
        self.txt = txt

def dvsn(x, y):
    try:
        if float(y) == 0:
            raise DivZError('!!!Division By Zero!!!')
        return float(x) / float(y)
    except ValueError:
        return f'Need a number'


a, b = input(f' Введите делимое и делитель через пробел: ').split()
try:
    c = dvsn(a, b)
except DivZError as err:
    print(err)
else:
    print(c)
print('Bye!!!')
