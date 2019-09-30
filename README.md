# Тестовое задание для компании [Decart IT-production](https://dcrt.it/)

Необходимо реализовать сервис со следующим функционалом на Ruby on Rails.

В базе данных (желательно применить Postgresql) должна быть таблица `Currency`
и соответствующая модель.

#### Колонки для таблицы:

1. `id` — первичный ключ
2. `name` — название валюты
3. `rate` — курс валюты к рублю

Должна быть `Rake task` для обновления данных в таблице currency. Данные по курсам валют можно взять 
[отсюда](http://www.cbr.ru/scripts/XML_daily.asp).

#### Реализовать 2 REST API метода:

1. `GET /currencies` — должен возвращать список курсов валют с возможностью пагинации
2. `GET /currency/` — должен возвращать курс валюты для переданного id

Ответ должен быть в формате JSON.

Наличие тестов обязательно. API должно быть закрыто bearer авторизацией.

# Запуск приложения

Для того, чтобы запустить приложение, выполните следующие команды у себя в окне терминала:

* Склонируйте репозиторий с GitHub и перейдите в папку приложения:
```
git clone https://github.com/cuurjol/decart_currency_api.git
cd decart_currency_api
```

* Установите необходимые гемы приложения, указанные в файле `Gemfile`:
```
bundle install
```

* Создайте базу данных, запустите миграции для базы данных и файл `seeds.rb` для создания записей в базу данных:
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```
Приложение использует СУБД `Postgressql`. При необходимости создайте нового пользователя в СУБД для этого приложения 
или измените СУБД на другую, изменив настройки файла `config/database.yml`.

* В приложении существует `Rake task`, которая обновляет курсы валют. Для того, чтобы запустить её, следует ввести 
следующую команду:
```
bundle exec rake db:update_currency_rates
```

* Запустите приложение:
```
bundle exec rails server
```

# Тестирование API

Для того, чтобы протестировать API, воспользуйтесь таким инструментом, как [cURL](https://ru.wikipedia.org/wiki/CURL)
или другим удобным вам инструментом. Тестирование API было осуществленно с помощью [Postman](https://www.getpostman.com/). 
Могут возникнуть проблемы с тестированием, когда вы будете в заголовок запроса класть значение токена пользователя 
по ключу заголовка `HTTP_BEARER_AUTH_TOKEN` или `BEARER_AUTH_TOKEN`. Может оказаться так, что ключ заголовка запроса 
будет совершенно другим. Тогда в этой ситуации следует изменить название ключа заголовка на ваше значение:
```
# app/controllers/application_controller.rb
# Мой вариант для Postman:
request.headers['HTTP_BEARER_AUTH_TOKEN']

# В Postman значение ключа заголовка запроса следует передавать, 
# как BEARER_AUTH_TOKEN

# Ваш вариант изменения ключа заголовка запроса:
request.headers['YOUR_HEADER_KEY']

# Далее, в зависимости от того, каким инструментом пользуетесь, 
# определяете значение вашего ключа заголовка запроса самостоятельно
```

