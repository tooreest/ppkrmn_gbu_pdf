print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 2. Встроенные типы и операции с ними')
print('Домашнее задание 2.\nДля списка реализовать обмен значений соседних элементов, т.е.\n\
Значениями обмениваются элементы с индексами 0 и 1, 2 и 3 и т.д. \n\
При нечетном количестве элементов последний сохранить на своем месте. \n\
Для заполнения списка элементов необходимо использовать функцию input().\n')

userlist = []
result = []

# Ввод элементов через ","
userinput = input('Введите элементы разделяя их пробелом: ')
userlist = userinput.split()

# Cрезы чет/нечет
l1 = userlist[::2]
l2 = userlist[1::2]
for i in range(0,len(l2)):  # длина l2 всегда мееньше длины l1
	result.append(l2[i])
	result.append(l1[i])
if len(l1) != len(l2):  # Если длины разные, было нечетное количество
	result.append(l1[-1])
# Вывод исходного и результирующего списков
print(f'Список пользователя:\t{userlist}')
print(f'Результат:\t\t{result}')

# Решение в 3 строки.
for i in range(0, len(userlist) - 1, 2):
    userlist[i], userlist[i + 1] = userlist[i + 1], userlist[i]
print(f'Результат в три строки:\t{userlist}')
print('\nBye!!!')
