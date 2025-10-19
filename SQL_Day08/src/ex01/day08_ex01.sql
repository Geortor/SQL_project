BEGIN; --- начинаем транзакцию
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; ---  смотрим исходник
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --- меняем
COMMIT; --- завершаем транзакцию

--------
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'

