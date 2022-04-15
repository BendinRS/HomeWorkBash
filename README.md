# Домашняя работа Bash and filters
_Дано:_
файл [access.log](access.log)

_Задание:_
Написать скрипт для крона, который раз в час присылает на заданную почту:

### _X IP адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта_

Разберемся сначала с самим скриптом, который отфильтрует нам нужную информацию из лога

_файл [scriptXip.sh](scriptXip.sh):_

1. Читает лог
2. awk берет столбец с ip адресами
3. Сортировка
4. Подсчет уникальных адресов с выводом количества повторений
5. Вывод информации во временный файл
6. Условие выведет на экран адреса с количеством повторений больше 10

Результат:

```out
Count ip > 10
39 repeats with ip: 109.236.252.130
22 repeats with ip: 148.251.223.21
12 repeats with ip: 162.243.13.195
12 repeats with ip: 185.142.236.35
20 repeats with ip: 185.6.8.9
33 repeats with ip: 188.43.241.106
37 repeats with ip: 212.57.117.19
17 repeats with ip: 217.118.66.161
12 repeats with ip: 62.210.252.196
24 repeats with ip: 62.75.198.172
31 repeats with ip: 87.250.233.68
45 repeats with ip: 93.158.167.130
12 repeats with ip: 95.108.181.93
16 repeats with ip: 95.165.18.146
```

### Y запрашиваемых адресов (с наибольшим кол-вом запросов) с указанием кол-ва запросов c момента последнего запуска скрипта

_файл [scriptYurl.sh](scriptYurl.sh):_

1. Читаем лог
2. Забираем URL
3. Сортировка
4. Подсчет уникальных URL с выводом количества повторений
5. Вывод информации во временный файл
6. Условие выведет на URL адреса с количеством повторений больше 5

Результат:
```out2
URL > 5
9 repeats with URL: http://www.google.com
11 repeats with URL: http://www.bing.com
16 repeats with URL: http://dbadmins.ru
20 repeats with URL: http://www.domaincrawler.com
21 repeats with URL: http://www.semrush.com
124 repeats with URL: http://yandex.com
166 repeats with URL: https://dbadmins.ru
```



### Все ошибки c момента последнего запуска

_файл [error.sh](error.sh):_

1. Забираем коды ошибок в файл tmp
2. Забираем в файл временной диапазон лога
3. Выводим информацию со временем и коды ошибок

Результат:

```out3
error output from 14/Aug/2019:04:12:10 to 15/Aug/2019:00:25:46:
301
304
400
403
404
405
499
500
```
### Настройка отправки на почту

Собираем вывод всех скриптов в один файл

_файл [parse.sh](parse.sh):_

Настраиваем cron и postfix. Воспользовался статьей https://www.dmosk.ru/miniinstruktions.php?mini=postfix-over-yandex для настройки почты и https://habr.com/ru/post/114622/ для защиты от мультизапуска

Конфиг крона:

```out4
MAILTO=<*******@yandex.ru>
0 * * * * /usr/local/bin/lockrun --lockfile=/tmp/parse.lockrun --sh /home/HomeWorkBash/parse.sh | mail -s 'test' ***@yandex.ru
```
