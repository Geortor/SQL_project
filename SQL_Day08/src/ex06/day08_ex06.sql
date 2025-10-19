BEGIN; --- начало транзакции
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; --- меняем уровень изоляции в 2-х сессиях
SHOW transaction_isolation; --- проверяем уровень изоляции
SELECT SUM(rating) FROM pizzeria; --- запрос
INSERT INTO pizzeria values (11,'Kazan Pizza 2', 4); --- добавляем новые данные в транзакции cессии №2
SELECT SUM(rating) FROM pizzeria; --- запрос повторяем
COMMIT; --- вносим изменения транзакции

SELECT SUM(rating) FROM pizzeria; --- запрос делвем на 2 сессиях
