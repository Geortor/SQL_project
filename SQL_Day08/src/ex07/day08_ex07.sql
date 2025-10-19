BEGIN; --- начало транзакции
UPDATE pizzeria SET rating = 2.78 WHERE id = 1; --- обновляем в 1 cессии
UPDATE pizzeria SET rating = 3.78 WHERE id = 2; --- обновляем во 2 сессии
UPDATE pizzeria SET rating = 3.78 WHERE id = 2; --- обновляем в 1 сессии
UPDATE pizzeria SET rating = 2.78 WHERE id = 1; --- обновляем во 2 cессии
COMMIT; --- вносим изменения транзакции в обоих сессиях