#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 5. Работа с файлами
Домашнее задание 3.
Создать текстовый файл (не программно), построчно записать фамилии сотрудников
и величину их окладов. Определить, кто из сотрудников имеет оклад менее 20 тыс.,
вывести фамилии этих сотрудников. Выполнить подсчет средней величины дохода
сотрудников.

'''

def fread(fn):
    try:
        f = open(fn, 'r', encoding='utf-8')
    except IOError:
        return f'File {fn} doesn\'t exist!'

    readed = f.readlines()
    f.close()
    result = {}
    for i in readed:
        n = i.split()
        result[n[0]] = float(n[1])
    return result

in_fname = 'in_task_03.txt'
content = fread(in_fname)
salary_limit = 20000

if not isinstance(content, dict):
    print(content)
else:
    empl_low20 = []
    empl_all = 0
    sum = 0

    for i in content.items():
        if i[1] < salary_limit:
            empl_low20.append(i[0])
        empl_all  += 1
        sum += i[1]

    print(f'Сотрудники, которые зарабытывают меньше 20000р.: {", ".join(empl_low20)}.')
    print(f'Средняя "температура по больнице": {sum/empl_all:.2f}р.')

print('Bye!!!')
