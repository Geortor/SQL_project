BEGIN; --- начинаем транзакцию
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --- содержание транзакции
COMMIT;---публикация изменений тразакции для всех пользователей