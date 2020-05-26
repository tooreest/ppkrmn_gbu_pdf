#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 7. ООП. Продвинутый уровень.
Домашнее задание 2.
Реализовать проект расчета суммарного расхода ткани на производство одежды.
Основная сущность (класс) этого проекта — одежда, которая может иметь
определенное название. К типам одежды в этом проекте относятся пальто и костюм.
У этих типов одежды существуют параметры: размер (для пальто)
и рост (для костюма). Это могут быть обычные числа: V и H, соответственно.
Для определения расхода ткани по каждому типу одежды использовать формулы:
для пальто (V/6.5 + 0.5), для костюма (2 * H + 0.3). Проверить работу этих
методов на реальных данных. Реализовать общий подсчет расхода ткани. Проверить
на практике полученные на этом уроке знания: реализовать абстрактные классы для
основных классов проекта, проверить на практике работу декоратора @property.

'''

from abc import ABC
from abc import abstractmethod

class Clothes(ABC):
    def __init__(self, name, param):
        super().__init__()
        self.name = name
        self.param = param

    @abstractmethod
    def consumption(self):
        pass

class Costume(Clothes):
    @property
    def consumption(self):
        return round(2*self.param + 0.3, 2)

class Coat(Clothes):
    @property
    def consumption(self):
        return round(self.param/6.5 + 0.5, 2)


costume = Costume('Костюм', 1.8)
coat = Coat('Пальто', 25)

print(f'Для пошива {costume.name} нужно {costume.consumption} ткани.')
print(f'Для пошива {coat.name} нужно {coat.consumption} ткани.')

