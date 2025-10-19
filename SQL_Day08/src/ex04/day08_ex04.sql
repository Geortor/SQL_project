BEGIN; --- начало транзакции
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--- меняем уровень изоляции (его  можно менять внутри транзакции)
SHOW transaction_isolation; --- проверяем уровень изоляции
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut'; --- запрос
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; --- обновляем
COMMIT; --- вносим изменения транзакции 