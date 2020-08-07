#! +
"""
Geekbrains. Факультет python-разработки
Студент: Папко Роман.
Четверть 1. Алгоритмы и структуры данных на Python. Базовый курс
Урок 3. Хэш-функции.
Домашнее задание 4.
"""

"""
Задание 4.
Реализуйте скрипт "Кэширование веб-страниц"

Функция должна принимать url-адрес и проверять
есть ли в кэше соответствующая страница, если нет, то вносит ее в кэш

Подсказка: задачу решите обязательно с применением 'соленого' хеширования
Можете условжнить задачу, реализовав ее через ООП
"""

from uuid import uuid4
from hashlib import sha256


def url_hashing(u, salt):
    u_hash = sha256(u.encode() + salt.encode()).hexdigest()
    return u_hash, salt

def add_to_cache(u):
    global cache_hash
    h,s = url_hashing(u, uuid4().hex)
    cache_hash[h] = s
    
def check_url(u):
    global cache_hash
    for k, v in cache_hash.items():
        if url_hashing(u, v)[0] == k:
            return 1
    to_add = input(f'Добавить URL {u} в базу (y/n)? ')
    if to_add == 'y':
        add_to_cache(u)
    else:
        return
   
urls_list = [
            'https://mail.ru',
            'https://google.ru',
            'https://geekbrains.ru',
            'https://geekbrains.ru/education'
           ]  
checking_urls = [
                'https://yandex.ru',
                'https://google.ru',
                'https://geekbrains.ru',
                'https://yahoo.com'
               ]

cache_hash = {}

for i in urls_list:
    add_to_cache(i)
print(f'Всего в базе {len(cache_hash)} ссылок,\n{cache_hash}')

for i in checking_urls:
    check_url(i)
print(f'Всего в базе {len(cache_hash)} ссылок,\n{cache_hash}')
