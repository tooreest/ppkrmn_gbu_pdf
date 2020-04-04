#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 6. Объектно-ориентированное программирование.
Домашнее задание 1.
Создать класс TrafficLight (светофор) и определить у него один атрибут color
(цвет) и метод running (запуск). Атрибут реализовать как приватный.
В рамках метода реализовать переключение светофора в режимы: красный, желтый,
зеленый. Продолжительность первого состояния (красный) составляет 7 секунд,
второго (желтый) — 2 секунды, третьего (зеленый) — на ваше усмотрение.
Переключение между режимами должно осуществляться только в указанном порядке
(красный, желтый, зеленый). Проверить работу примера, создав экземпляр и
вызвав описанный метод.
Задачу можно усложнить, реализовав проверку порядка режимов, и при его
нарушении выводить соответствующее сообщение и завершать скрипт.

'''


class TrafficLight:
    '''
    Класс TrafficLight. Принимает тайминги работы каждого цвета
    (красный, желтый, зеленый) и количество повторений (по-умолчанию 3)
    '''

    __color = ['red', 'yellow', 'green']
    def __init__ (self, redtime, yellowtime, greentime, cycle_count = 3):
        self.redtime = redtime
        self.yellowtime = yellowtime
        self.greentime = greentime
        self.cycle_count = cycle_count

    def running(self):
        from time import sleep
        colorprint ={
                TrafficLight.__color[0]:('\033[31m','\033[37m','\033[37m', self.redtime),
                TrafficLight.__color[1]: ('\033[37m','\033[33m','\033[37m', self.yellowtime),
                TrafficLight.__color[2]:('\033[37m', '\033[37m', '\033[32m', self.greentime)
                }
        cycle = (TrafficLight.__color[0], TrafficLight.__color[1], TrafficLight.__color[2], TrafficLight.__color[1])
        start = 1
        while self.cycle_count >= start:
            for i in cycle:
                print('\033[2J')  # Clear screen
                print(colorprint[i][0] + '00\n00\n' +
                        colorprint[i][1] + '00\n00\n' +
                        colorprint[i][2] + '00\n00\n' +
                        '\033[37m'
                        )
                sleep(colorprint[i][3])
            start += 1


t = TrafficLight(7, 2, 5)
t.running()

print('Bye!!!')
