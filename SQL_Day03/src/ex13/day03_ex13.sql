DELETE FROM person_order WHERE order_date = '2022-02-25'

DELETE FROM person_order
WHERE order_date = (SELECT MAX(order_date) FROM person_order);
