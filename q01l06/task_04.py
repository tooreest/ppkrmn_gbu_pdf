#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 6. Объектно-ориентированное программирование.
Домашнее задание 4.
Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты:
speed, color, name, is_police (булево). А также методы: go, stop, turn(direction),
которые должны сообщать, что машина поехала, остановилась, повернула (куда).
Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar.

Добавьте в базовый класс метод show_speed, который должен
показывать текущую скорость автомобиля. Для классов TownCar и WorkCar
переопределите метод show_speed. При значении скорости свыше 60 (TownCar)
и 40 (WorkCar) должно выводиться сообщение о превышении скорости.
Создайте экземпляры классов, передайте значения атрибутов.
Выполните доступк атрибутам, выведите результат.
Выполните вызов методов и также покажите результат.

'''

class Car:
    def __init__(self, name, color, speed, is_police = False):
        self.name = name
        self.speed = speed
        self.color = color
        self.is_police = is_police

    def go(self):
        return f'Car is going!'

    def stop(self):
        return f'Car is stopped!'

    def turn(self, where_to):
        self.where_to = where_to
        return f'Car turn to {self.where_to}.'

    def show_speed(self):
        return(f'Car moving with speed {self.speed} km/h')

class TownCar(Car):
    def show_speed(self):
        if self.speed > 60:
            return f'It is a towncar. You speed is high. Please slowly.'
        else:
            return f'Car moving with speed {self.speed} km/h'
    
class SportCar(Car):
    #return f'This is sportcar. Press accelerator.'
    pass

class WorkCar(Car):
    def show_speed(self):
        if self.speed > 40:
            return f'It is workcar. You speed is high. Please slowly.'
        else:
            return f'Car moving with speed {self.speed} km/h'

class PoliceCar(Car):
    pass


car  = Car('Opel', 'Silver',  60)
townCar = TownCar('Chrysler', 'Blue',  65)
sportCar  = SportCar('McLaren', 'Red',  120)
workCar = WorkCar('Lada', 'Black',  45)
policeCar = PoliceCar('Ford', 'Silver-Blue', 75,  True)


print(car.go())
print(car.show_speed())
print(car.turn('left'))
print(car.turn('right'))
print(car.stop())

print(townCar.show_speed())
print(workCar.show_speed())
