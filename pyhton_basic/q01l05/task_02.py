#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 2.
Создать текстовый файл (не программно), сохранить в нем несколько строк,
выполнить подсчет количества строк, количества слов в каждой строке.

'''

def freadlns(fn):
    try:
        f = open(fn, 'r', encoding='utf-8')
    except IOError:
        return f'File {fn} doesn\'t exist!'
    readed = f.readlines()
    f.close()
    result = []
    for i in readed:
        result.append(i.replace('\n', ''))
    return result

def wordcount(str):
    return len(str.split())

def charcount(str):
    x = 0
    try:
        for i in str.replace(' ', ''):
            if i.isalpha():
                x += 1
    except UnboundLocalError:
        pass
    return x


in_fname = '_in_task_02.txt'
content = freadlns(in_fname)

if __name__ == '__main__':
    if not isinstance(content, list):
        print(content)
        print(f'First you need to complete the first task')
    else:
        print(f'Number of lines in a file "{in_fname}" - {len(content)}')
        for i in content:
            countword = wordcount(i)
            countchar = charcount(i)
            print(f'In line "{i}" - {countword} word(s), {countchar} chars.')
    print('Bye!!!')
