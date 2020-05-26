print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 1. Знакомство с Python.')
print('Домашнее задание 4. Пользователь вводит целое положительное число. Найдите самую большую цифру в числе. Для решения используйте цикл while и арифметические операции.')

number = int(input('Введите целое число: ' ))
max = 0
while True:
    n = number % 10
    number //= 10
    if max == 9:
        break
    if max < n:
        max = n
#    print(number, n, max)
    if number < max:
        break
print(f'Максимальная цифра в числе - {max}')
