#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 8. ООП. Полезные дополнения.
Домашнее задание 7.
Реализовать проект «Операции с комплексными числами».
Создайте класс «Комплексное число», реализуйте перегрузку методов сложения и
умножения комплексных чисел.
Проверьте работу проекта, создав экземпляры класса (комплексные числа)
и выполнив сложение и умножение созданных экземпляров.
Проверьте корректность полученного результата.

'''
class ComplexNum:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    @property
    def cnum(self):
        return f'{self.a}+{self.b}i' if float(self.b) >= 0 else  f'{self.a}{self.b}i'

    def __add__(self, other):
        a = self.a + other.a
        b = self.b + other.b
        return ComplexNum(a, b)

    def __mul__(self, other):
        a = self.a*other.a - self.b*other.b
        b = self.b*other.a + self.a*other.b
        return ComplexNum(a, b)


cmplxn1 = ComplexNum(-2, 3)
cmplxn2 = ComplexNum(4, -5)

print(cmplxn1.cnum)
print(cmplxn2.cnum)
print((cmplxn1 + cmplxn2).cnum)
print((cmplxn1 * cmplxn2).cnum)
