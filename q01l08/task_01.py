#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 8. ООП. Полезные дополнения.
Домашнее задание 1.
Реализовать класс «Дата», функция-конструктор которого должна принимать дату
в виде строки формата «день-месяц-год». В рамках класса реализовать два метода.
Первый, с декоратором @classmethod, должен извлекать число, месяц, год
и преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod,
должен проводить валидацию числа, месяца и года (например, месяц — от 1 до 12).
Проверить работу полученной структуры на реальных данных.

'''
class Date:
    def __init__(self, dstr):
        self.dstr = dstr

    @classmethod
    def date_of_string(cls, instr):
        day, month, year = instr.split()
        mdict = {'01':('январь', 'января'),
                 '02':('февраль', 'февраля'),
                 '03':('март', 'марта'),
                 '04':('апрель', 'апреля'),
                 '05':('май', 'мая'),
                 '06':('июнь', 'июня'),
                 '07':('июль', 'июля'),
                 '08':('август', 'августа'),
                 '09':('сентябрь', 'сентября'),
                 '10':('октябрь', 'октября'),
                 '11':('ноябрь', 'ноября'),
                 '12':('декабрь', 'декабря')
                }
        for k, v in mdict.items():
            if month in v:
                month = k
                break
        if Date.check_date('-'.join([day, month, year])):
            return cls('-'.join([day, month, year]))
        else:
            return cls(f'String is not date or incorrect date')

    @staticmethod
    def check_date(strng):
        from datetime import date as dt
        try:
            day, month, year = strng.split('-')
        except ValueError:
            return False
        try:
            dt(int(year), int(month), int(day))
            return True
        except ValueError:
            return False


d1 = Date('20-02-1981')
d2 = Date.date_of_string('21 февраля 1981')
d3 = Date('22-02-1981')
d4 = Date.date_of_string('30 февраля 1981')

print(d1.dstr)
print(d2.dstr)
print(d3.dstr)
print(d4.dstr)
print(d1.check_date('17-12-2020'))
print(Date.check_date(d4.dstr))
