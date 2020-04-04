#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 6. Объектно-ориентированное программирование.
Домашнее задание 3.
Реализовать базовый класс Worker (работник), в котором определить атрибуты:
name, surname, position (должность), income (доход). Последний атрибут должен
быть защищенным и ссылаться на словарь, содержащий элементы: оклад и премия,
например, {"wage": wage, "bonus": bonus}. Создать класс Position (должность)
на базе класса Worker. В классе Position реализовать методы получения полного
имени сотрудника (get_full_name) и дохода с учетом премии (get_total_income).
Проверить работу примера на реальных данных (создать экземпляры
класса Position, передать данные, проверить значения атрибутов,
вызвать методы экземпляров).

'''

class Worker:
    def __init__(self, name, surname, position, wage, bonus):
        self.name = name
        self.surname = surname
        self.position = position
        self._income =  {'wage':wage, 'bonus':bonus}

class Position(Worker):
    def get_full_name(self):
        return f'{self.surname} {self.name}'

    def get_total_income(self):
        return f'{self._income["wage"] + self._income["bonus"]}'


plumber = Position('Ivan', 'Ivanoff', 'plumber', 30000, 7500)
electrician = Position('Peter', 'Petroff', 'electrician', 32000, 7000)

print(f'{plumber.get_full_name()} - {plumber.get_total_income()}р.')
print(f'{electrician.get_full_name()} - {electrician.get_total_income()}р.')
print('Bye!!!')
