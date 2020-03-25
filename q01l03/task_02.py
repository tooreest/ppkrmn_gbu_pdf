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
def user(fname, lname,  bdate,  city,  em,   phone):
    d = {'Имя': fname, 'Фамилия': lname,  'Дата рождения':  bdate,  'Город': city,  'E-mail': em,  'Телефон': phone}
    return d

u_data = False
while not u_data:
    try:
        u_data = (input(f'Введите: Имя Фамилию дату рождения город_проживания email телефон: ')).split()  # Создаем кореж данных о пользователе
#        u_data = 'Иван Иванов 01.01.1985 Новгород-Северский login@server.ru +79876543210'.split()  # Верный тестовый ввод
#        u_data = '0'.split()  # Не верный тестовый ввод
    except IndexError:
        u_data = False
        print ('Не корректный ввод.')
    try:
        u = user(fname=u_data[0], lname=u_data[1],  bdate=u_data[2],  city=u_data[3],  em=u_data[4],  phone=u_data[5] )
    except IndexError:
        print(f'Количество данных не соответствует запросу.')
        u_data = False

print(f'Пользователь {u["Имя"]} {u["Фамилия"]} который родился {u["Дата рождения"]} проживает в городе {u["Город"]}.\n\
Связаться с ним можно по телефону {u["Телефон"]} или e-mail {u["E-mail"]}.')
print('Bye!!!')
