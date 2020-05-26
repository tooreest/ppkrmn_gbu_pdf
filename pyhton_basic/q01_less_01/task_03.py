print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 1. Знакомство с Python.')
print('Домашнее задание 3. Узнайте у пользователя число n. Найдите сумму чисел n + nn + nnn. Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369')

usrinp = input('Введите число: ')
res = int(usrinp) + int(usrinp + usrinp) + int(usrinp + usrinp + usrinp)
print(f'{usrinp} + {usrinp + usrinp} + {usrinp + usrinp + usrinp} = {res}')
