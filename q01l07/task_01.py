#!
'''

Geekbrains. Факультет python-разработки
Четверть 1. Основы языка Python
Урок 7. ООП. Продвинутый уровень.
Домашнее задание 1.
Реализовать класс Matrix (матрица).
Обеспечить перегрузку конструктора класса (метод init()), который должен
принимать данные (список списков) для формирования матрицы.
Подсказка: матрица — система некоторых математических величин, расположенных
в виде прямоугольной схемы.

Примеры матриц вы найдете в методичке.

Следующий шаг — реализовать перегрузку метода str() для вывода матрицы
в привычном виде. Далее реализовать перегрузку метода add() для реализации
операции сложения двух объектов класса Matrix (двух матриц).
Результатом сложения должна быть новая матрица.
Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент
первой строки первой матрицы складываем с первым элементом первой строки второй
матрицы и т.д.

'''

class Matrix:
    def __init__ (self, lst):
        self.lst = lst

    def __str__(self):
        self.lststr = ''
        for i in self.lst:
            for j in i:
                self.lststr += f'{j} '
            self.lststr += '\n'
        return(self.lststr)

    def __add__(self, other):
        numrow = len(self.lst) if len(self.lst) >= len(other.lst) else len(other.lst)
        self.resultlst = []
        for i in range(numrow):
            try:
                row1, row2 = (self.lst[i], other.lst[i]) if len(self.lst[i]) >= len(other.lst[i]) else (other.lst[i], self.lst[i])
                self.resultlst.append(row1)
                for j in range(len(row1)):
                    try:
                        self.resultlst[i][j] += row2[j]
                    except IndexError:
                        pass
            except IndexError:
                pass
        add = (self.lst[len(self.resultlst):]) if len(self.lst) > len(other.lst) else (other.lst[len(self.resultlst):])
        for i in add:
            self.resultlst.append(i)
        return self.resultlst


mx = Matrix([[1, 1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4]])
xm = Matrix([[1, 1, 1], [2, 2, 2, 2, 2], [3, 3, 3], [4, 4, 4], [5], [6] ])
print(mx)
print(xm)
mxxm = Matrix(mx + xm)
print(mxxm)
