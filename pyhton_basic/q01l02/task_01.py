print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 2. Встроенные типы и операции с ними')
print('Домашнее задание 1.\nСоздать список и заполнить его элементами различных типов данных.\n\
Реализовать скрипт проверки типа данных каждого элемента.\n\
Использовать функцию type() для проверки типа.\n\
Элементы списка можно не запрашивать у пользователя, а указать явно, в программе.')


my_list = [\
           's', 2, 3.4, True, [1, 'a'], ('s', 1.2), \
           {'s', 2}, {'a':1 , 'b':2}, None, \
           b'string', bytearray(b"string")\
           ]  # Создаем список с элементами разных типов
# В цикле for in перебираем элементы, проверяем их тип и выводим инфрмацию о каждом элементе.
for i in my_list:
	if str(type(i)) == "<class 'str'>":
		eltype='строка'
	elif str(type(i)) == "<class 'int'>":
		eltype='целое число'
	elif str(type(i)) == "<class 'float'>":
		eltype='число с плавающей точкой'
	elif str(type(i)) == "<class 'bool'>":
		eltype='логический тип'
	elif str(type(i)) == "<class 'list'>":
		eltype='список'
	elif str(type(i)) == "<class 'tuple'>":
		eltype='кортеж'
	elif str(type(i)) == "<class 'set'>":
		eltype='множество'
	elif str(type(i)) == "<class 'NoneType'>":
		eltype='тип None'
	elif str(type(i)) == "<class 'bytes'>":
		eltype='байты'
	elif str(type(i)) == "<class 'bytearray'>":
		eltype='массив байт'
	elif str(type(i)) == "<class 'dict'>":
		eltype='словарь'
                        
	else:
		eltype='Надо подучить теорию )).'
	print(f'- {type(i)} \t {eltype} \t {i}')
