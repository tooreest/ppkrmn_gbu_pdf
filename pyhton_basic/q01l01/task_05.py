print('Geekbrains. Факультет python-разработки')
print('Четверть 1. Основы языка Python')
print('Урок 1. Знакомство с Python.')
print('Домашнее задание 5. Запросите у пользователя значения выручки и издержек фирмы. \
Определите, с каким финансовым результатом работает фирма \
(прибыль — выручка больше издержек, или убыток — издержки больше выручки). \
Выведите соответствующее сообщение. Если фирма отработала с прибылью, вычислите рентабельность выручки \
(соотношение прибыли к выручке). Далее запросите численность сотрудников фирмы \
и определите прибыль фирмы в расчете на одного сотрудника.')

revenue = float(input('Введите сумму выручки. р.: '))
costs = float(input('Введите сумма издержек, р.: '))

workresult = revenue - costs
if workresult < 0:
    print(f'К сожалению Ваша органицация не прибыльна. Убыток составил {workresult} р.')
elif workresult == 0:
    print(f'Фирма отработала в "0", что тоже не плохо.')
else:
    print(f'Ваша фирма принесла прибыль {workresult} р.')
    profitability = (revenue - costs) / revenue
    print(f'Рентабельность Вашей фирмы составила {profitability:.2%}')
    employeers = int(input('Введите количество сотрудников в фирме: '))
    profit_on_emp = (revenue - costs) / employeers
    print(f'Каждый сотрудник заработал для фирмы {profit_on_emp:.2f} р.')
