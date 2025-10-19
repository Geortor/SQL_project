BEGIN; --- начало транзакции
SHOW transaction_isolation; --- проверяем уровень изоляции
SELECT SUM(rating) FROM pizzeria; --- запрос
INSERT INTO pizzeria values (10,'Kazan Pizza', 5); --- добавляем новые данные в транзакции сесии №2
COMMIT; --- вносим изменения транзакции 