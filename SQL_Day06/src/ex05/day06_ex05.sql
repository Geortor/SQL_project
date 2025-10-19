COMMENT ON TABLE person_discounts IS 'this table is needed in order to show dicount for all people - таблица нужна для проверки и отслеживания скидок для покупателей и пиццерий '
-----
COMMENT ON COLUMN person_discounts.id IS 'Primary key ID';
COMMENT ON COLUMN person_discounts.person_id IS 'Person ID foreign key';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID foreign key';
COMMENT ON COLUMN person_discounts.discount IS 'Discount amount';
