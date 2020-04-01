#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 1.
Создать программно файл в текстовом формате, записать в него построчно данные,
вводимые пользователем. Об окончании ввода данных свидетельствует пустая строка.

'''

def writef (lst, fn):
    f = open(fn, 'w', encoding='utf-8')
    f.writelines(lst)
    print(f'File {fn} was saved.')
    f.close()


out_fname = 'out_task_01.txt'

writelst = []
uinp= input(f'Input string and press <enter>. To end input - an empty string.\n: ')
while uinp:
    writelst.append(uinp + '\n')
    uinp = input(': ')
writef(writelst, out_fname)
print('Bye!!!')
