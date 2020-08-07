#! +
"""
Geekbrains. Факультет python-разработки
Студент: Папко Роман.
Четверть 1. Алгоритмы и структуры данных на Python. Базовый курс
Урок 3. Хэш-функции.
Домашнее задание 2.
"""

"""
Задание 2.
Ваша программа должна запрашивать пароль
Для этого пароля вам нужно получить хеш, используя функцию sha256
Для генерации хеша обязательно нужно использовать криптографическую соль
Обязательно выведите созданный хеш

Далее программа должна запросить пароль повторно
Вам нужно проверить, совпадает ли пароль с исходным
Для проверки необходимо сравнить хеши паролей

ПРИМЕР:
Введите пароль: 123
В базе данных хранится строка: 555a3581d37993843efd4eba1921f1dcaeeafeb855965535d77c55782349444b
Введите пароль еще раз для проверки: 123
Вы ввели правильный пароль
"""

from uuid import uuid4
from hashlib import sha256

def passwd_hashing():
    password = input(f'Введите пароль: ')
    salt = uuid4().hex
    passwd_hash = sha256(password.encode() + salt.encode()).hexdigest()
    print(f'В базе данных хранится строка: {passwd_hash}')
    return passwd_hash, salt

def passwd_check(upasswd):
    password = input(f'Введите пароль еще раз для проверки:')
    salt = upasswd[1]
    passwd_hash = sha256(password.encode() + salt.encode()).hexdigest()
    if upasswd[0] == passwd_hash:
        print(f'Вы ввели правильный пароль')
        #return True
    else:
        print(f'Вы ввели неверный пароль')
        #return False
        
userpassword = passwd_hashing()
passwd_check(userpassword)
