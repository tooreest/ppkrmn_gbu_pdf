#! +
"""
Geekbrains. Факультет python-разработки
Студент: Папко Роман.
Четверть 1. Алгоритмы и структуры данных на Python. Базовый курс
Урок 3. Хэш-функции.
Домашнее задание 3.
"""

"""
Задание 3.
Определить количество различных подстрок с использованием хеш-функции.
Дана строка S длиной N, состоящая только из строчных латинских букв.

Подсказка: примените хеши и множества

рара:

рар
ра
ар
ара
р
а
"""

from hashlib import sha256

def count_substrings(strng):
    all_subs_hashes = set()
    for i in range(len(strng)):
        for j in range(i+1, len(strng)+1):
            #print(f'{i}-{j} - {strng[i:j]}')
            all_subs_hashes.add(sha256(strng[i:j].encode()).hexdigest())
            #all_subs_hashes.add(strng[i:j])
    all_subs_hashes.discard(sha256(strng.encode()).hexdigest())  # Удаляю хэш полной строки
    #all_subs_hashes.discard(strng)
    #print(all_subs_hashes)
    return len(all_subs_hashes)
    
string = 'paapaa'
num_of_substrings = count_substrings(string)

print(num_of_substrings)
