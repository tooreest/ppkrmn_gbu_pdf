print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 2. Встроенные типы и операции с ними')
print('Домашнее задание 3.\nПользователь вводит месяц в виде целого числа от 1 до 12.\n\
Сообщить к какому времени года относится месяц (зима, весна, лето, осень).\n\
Напишите решения через list и через dict.')

# Вместо list использую tuple, в нашем случае не принципиально, но при этом меньше памяти и неизменяем пользовательским кодом.
year = ('12', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11')

# В словарь значения (месяцы) беру срезами, но можно было и вписать, если бы небыло переменной year.
seasons = {'Зима': year[:3], \
           'Весна': year[3:6], \
           'Лето': year[6:9], \
           'Осень': year[9:]}

print('Для определения принадлежности месяца к определенному сезону введите его номер. Выход - пустая строка')

usermonth = input('Месяц: ')
while usermonth:  # бесконечный цикл с выходом по пустой строке

#Решение задачи через список
    print('Определение результата через список')
    if usermonth not in year:
        print(f'Не корректный ввод. Введите число от 1 до 12, соответствующее номеру месяца')
    elif usermonth in year[:3]:
        print(f'Месяц с номером {usermonth} относится к сезону - Зима')
    elif usermonth in year[3:6]:
        print(f'Месяц с номером {usermonth} относится к сезону - Весна')
    elif usermonth in year[6:9]:
        print(f'Месяц с номером {usermonth} относится к сезону - Лето')
    else:
        print(f'Месяц с номером {usermonth} относится к сезону - Осень')
    print('определение через список окончено.\n')
    
#Решение задачи через словарь
    print('Определение результата через словарь')
    for k, v in seasons.items():
        n = False  # переменная для определения корректного ввода.
        if usermonth in v:
            n = True 
            print(f'Месяц с номером {usermonth} относится к сезону - {k}')
            break
    if n:
        print(f'Не корректный ввод. Введите число от 1 до 12, соответствующее номеру месяца')
        
    print('Определение через словарь окончено.')
    usermonth = input('Месяц: ')

print('Bye!!!')