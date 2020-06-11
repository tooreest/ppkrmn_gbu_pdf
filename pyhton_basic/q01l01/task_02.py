print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 1. Знакомство с Python.')
print('Домашнее задание 2. Пользователь вводит время в секундах.\nПереведите время в часы, минуты и сeкунды и выведите в формате чч:мм:сс. Используйте форматирование строк.')

userseconds = input('Введите время в секундах: ')
print(f'Преобразуем {userseconds} секунд в формат чч:мм:сс')
hh = int(userseconds) // 3600
#print(hh)
ss = int(userseconds) % 3600
#print(ss)
mm = ss // 60
#print(mm)
ss %= 60
#print(ss)
print(f'Вычисление показало, что {userseconds} секунд соответствует {hh:-02}:{mm:-02}:{ss:-02}.')
