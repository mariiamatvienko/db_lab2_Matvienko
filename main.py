import psycopg2
import matplotlib.pyplot as plt

username = 'Matvienko'
password = '111'
database = 'Matvienko_DB'
host = 'localhost'
port = '5432'

query_1 = '''
select TRIM(volc_country), count(volc_name) as volc_amount from volcano group by volc_country
'''
query_2 = '''
select TRIM(eruption_type), elevation FROM eruption_types join eruption using(eruption_id) where eruption_type <> 'Maar' 
union (SELECT TRIM(eruption_type), max(elevation)
   FROM eruption_types join eruption using (eruption_id) 
   WHERE eruption_type IN (SELECT eruption_type
   FROM eruption_types join eruption using (eruption_id) 
   GROUP BY eruption_type
   HAVING COUNT(*) > 1)
   group by eruption_type)
'''

query_3 = '''
select TRIM(volc_country), elevation from volcano join eruption using (volc_number)
'''

con = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(con))

with con:

    cur = con.cursor()

    print('1.  ')
    cur.execute(query_1)
    countries = []
    amount = []
    for row in cur:
        print(row)
        countries.append(row[0])
        amount.append(row[1])

    figure, (bar_ax, pie_ax, bar_2_ax) = plt.subplots(1, 3, figsize=(22,12))
    pie_ax.pie(amount, labels=countries, autopct='%1.1f%%')
    pie_ax.set_title('Кількість вулканів у кожній країні')
    # plt.show()

    print("\n2. ")
    cur.execute(query_2)
    type = []
    elevation = []
    for row in cur:
        print(row)
        type.append(row[0])
        elevation.append(abs(row[1]))

    bar_ax.bar(type, elevation, width=0.5)
    bar_ax.set_xticklabels(type, rotation=35, ha='right')
    bar_ax.set_title('Залежність висоти виверження від типу виверження вулкану')
    bar_ax.set_xlabel('Тип виверження')
    bar_ax.set_ylabel("Висота виверження")

    print("\n3. ")
    cur.execute(query_3)

    country = []
    elevation = []
    for row in cur:
        print(row)
        country.append(row[0])
        elevation.append(abs(row[1]))

    bar_2_ax.bar(country, elevation, width=0.5)
    bar_2_ax.set_title("Зв'язок країни та висоти виверження")
    bar_2_ax.set_xlabel('Країни')
    bar_2_ax.set_ylabel("Висота виверження")

    plt.show()

