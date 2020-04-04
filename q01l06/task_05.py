#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 6. Объектно-ориентированное программирование.
Домашнее задание 5.
Реализовать класс Stationery (канцелярская принадлежность).
Определить в нем атрибут title (название) и метод draw (отрисовка).
Метод выводит сообщение “Запуск отрисовки.” Создать три дочерних
класса Pen (ручка), Pencil (карандаш), Handle (маркер).
В каждом из классов реализовать переопределение метода draw.
Для каждого из классов метод должен выводить уникальное сообщение.
Создать экземпляры классов и проверить, что выведет описанный метод для
каждого экземпляра.

'''
class Stacionery:
    def __init__(self,title):
        self.title = title

    def draw(self):
        return f'{self.title} drawing start.'

class Pen(Stacionery):
    def draw(self):
        return f'{self.title} writes letters.'

class Pencil(Stacionery):
    def draw(self):
        return f'{self.title} draws a drawing.'

class Handle(Stacionery):
    def draw(self):
        return f'{self.title} highlight text.'


stacionery = Stacionery('Stacionery')
pen = Pen('Pen')
pencil = Pencil('Pencil')
handle = Handle('Handle')

lst = (stacionery, pen , pencil, handle)

for i in lst:
    print(i.draw())

print('Bye!!!')
