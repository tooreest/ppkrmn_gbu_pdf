#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 8. ООП. Полезные дополнения.
Домашнее задание 4.
Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад.
А также класс «Оргтехника», который будет базовым для классов-наследников.
Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
В базовом классе определить параметры, общие для приведенных типов.
В классах-наследниках реализовать параметры, уникальные для каждого типа оргтехники.

домашнее задание 5.
Продолжить работу над первым заданием. Разработать методы, отвечающие за приём
оргтехники на склад и передачу в определенное подразделение компании.
Для хранения данных о наименовании и количестве единиц оргтехники,а также других
данных, можно использовать любую подходящую структуру, например словарь.

Домашнее задание 6.
Продолжить работу над вторым заданием. Реализуйте механизм валидации вводимых
пользователем данных. Например, для указания количества принтеров,
отправленных на склад, нельзя использовать строковый тип данных.

Подсказка: постарайтесь по возможности реализовать в проекте «Склад оргтехники»
максимум возможностей, изученных на уроках по ООП.


'''
from abc import abstractmethod
from abc import ABC
class Stock:
    def __init__(self, places):
        self.places = places
        self.equips = []
    def to_stock(self, *equips):
        for e in equips:
            if len(self.equips) > self.places:
                print(f'Склад заполнен. Перед добавлением товара на склад нужно освободить метсо')
            elif e in self.equips:
               print(f'Товар уже на складе.')
            else:
                self.equips.append(e)
                print(f'{e} добавлен на склад.')
    def out_stock(self, *equips):
        for e in equips:
            if e in self.equips:
                del self.equips[self.equips.index(e)]
                print(f'{e} перемещен со склада.')
            else:
                print(f'Товар на складе отсутствует')
    def __str__(self):
        print(f'Товары на складе:')
        return f'{self.equips}'

class OffEquip(ABC):
    count = 0
    def __init__(self, manuf, model, sernum):
        self.manuf = manuf
        self.model = model
        self.sernum = sernum

    @abstractmethod
    def action(self):
        pass

    def __str__(self):
        return f'Устройство {self.manuf} {self.model} серийный номер {self.sernum}'


class Printer(OffEquip):
    def action(self, txt, numcopy):
        '''Печатает текст txt  указанное количество раз.'''
        self.txt = txt
        self.numcopy = numcopy
        for i in range(1, self.numcopy+1):
            print(f'Print {self.txt} page copy {i}.')

class Scanner(OffEquip):
    def action(self):
        scan = input(f'Enter original page: ')
        print(f'{self.model}. scan page {scan}')


class Xerox(OffEquip):
    def action(self, txt, numcopy):
        '''Печатает текст txt  указанное количество раз.'''
        self.txt = txt
        self.numcopy = numcopy
        copylst = []
        for i in range(1, self.numcopy+1):
            copylst.append(self.txt)
        print(f'Copy {self.txt} {self.numcopy} copy.')
        print(copylst)

stock = Stock(30)

pr01 = Printer('HP', '1536','printer001')
pr02 = Printer('Brother', '8065', 'printer002')
sc01 = Scanner('Mustek', 'BearPaw', 'scanner001')
sc02 = Scanner('HP', '2710', 'scanner002')
xx01 = Xerox('Canon', 'i_Sensis', 'xeoxr001')
xx02 = Xerox('Xerox', 'X2450', 'xerox003')
print(pr01)
pr01.action('Text', 3)
stock.to_stock(pr01, sc01, xx01)
print(stock)
stock.out_stock(sc01)
print(stock)

