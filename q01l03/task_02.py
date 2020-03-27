#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 3. Функции
Домашнее задание 2.
Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя:
имя, фамилия, год рождения, город проживания, email, телефон.
Функция должна принимать параметры как именованные аргументы.
Реализовать вывод данных о пользователе одной строкой.

'''
def user(**kwargs):
    return (f'Пользователь {kwargs["f_name"]} {kwargs["l_name"]}, рожденный {kwargs["b_data"]} года, проживает в городе {kwargs["city"]}. \
Связаться с ним можно по телефону {kwargs["phone"]} или e-mail {kwargs["mail"]}.')

u_data = False
while not u_data:
    try:
#        u_data = (input(f'Введите: Имя Фамилию дату рождения город_проживания email телефон: ')).split()  # Создаем кореж данных о пользователе
        u_data = 'Олег Вещий 01.01.850 Новгород-Северский oleg@novgorod-severskiy.ua +380987654321'.split()  # Верный тестовый ввод
#        u_data = '0'.split()  # Не верный тестовый ввод
    except IndexError:
        u_data = False
        print ('Не корректный ввод.')
        
    try:
        u = user(f_name=u_data[0], l_name=u_data[1],  b_data=u_data[2],  city=u_data[3],  mail=u_data[4],  phone=u_data[5] )
    except IndexError:
        print(f'Количество данных не соответствует запросу.')
        u_data = False

    print(u)
print('Bye!!!')
