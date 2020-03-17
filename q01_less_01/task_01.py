print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 1. Знакомство с Python.')
print('Домашнее задание 1. Поработайте с переменными, создайте несколько, выведите на экран, запросите у пользователя несколько чисел и строк и сохраните в переменные, выведите на экран.')

a = 29
b = 13
c = a + b
print(a)
print(b)
print(c)
print(f"{a} + {b} = {c}")
c = a * b
print(f"{a} * {b} = {c}")
c = a ** b
print(f"{a} ** {b} = {c}")
c = a // b
print(f"{a} // {b} = {c}")
c = a % b
print(f"{a} % {b} = {c}")

strng = 'st'
print(f"{strng} + {strng} + {strng} = {strng + strng + strng}")

userinp01 = input('Введите первое число: ')
userinp02 = input('Введите второе число: ')
print(f"{userinp01} * {userinp02} = {float(userinp01) * float(userinp02) :.2f}")
print(f"{userinp01} / {userinp02} = {float(userinp01) / float(userinp02) :.3f}")
print(f"{userinp01} // {userinp02} = {int(float(userinp01) // float(userinp02))}")

userinp01 = input('Введите строку: ')
userinp02 = input('Введите еще одну: ')
print(f"{userinp01} + {userinp02} = {userinp01 + userinp02}")
