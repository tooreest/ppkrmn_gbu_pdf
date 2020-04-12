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
class Stock:
    def __init__(self, places):
        self.places = places
        self.equips = []

    def place_to_stock(self, equip):
        self.equip = equip
        self.equips.append(self.equip)
        print(self.equips)

class OffEquip:
    count = 0
    def __init__(self, manuf, model, sernumb):
        self.manuf = manuf
        self.model = model
        self.sernumb = sernumb

class Printer(OffEquip):
    def printpage(self, txt, numcopy):
        '''Печатает текст txt  указанное количество раз.'''
        self.txt = txt
        self.numcopy = numcopy
        for i in range(1, self.numcopy+1):
            print(f'Print {self.txt} page copy {i}.')

class Scanner(OffEquip):
    def scanpage(self):
        scan = input(f'Enter original page: ')
        print(f'{self.model}. scan page {scan}')


class Xerox(OffEquip):
    def printpage(self, txt, numcopy):
        '''Печатает текст txt  указанное количество раз.'''
        self.txt = txt
        self.numcopy = numcopy
        copylst = []
        for i in range(1, self.numcopy+1):
            copylst.append(self.txt)
        print(f'Copy {self.txt} {self.numcopy} copy.')
        print(copylst)

stock = Stock(30)

pr01 = Printer('HP', '1536','0001')
pr02 = Printer('Brother', '8065', '0001')

sc01 = Scanner('Mustek', 'BearPaw', '001')
sc02 = Scanner('HP', '2710', '001')

xx01 = Xerox('Canon', 'i_Sensis', '001')
xx02 = Xerox('Xerox', 'X2450', '001')


#print(pr01.manuf, pr01. model, pr01.sernumb)
#pr01.printpage('Text',3)
#sc01.scanpage()

stock.place_to_stock(pr01)
