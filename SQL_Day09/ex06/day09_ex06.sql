CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (pperson VARCHAR DEFAULT 'Dmitriy', pprice numeric DEFAULT 500, pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(pizzeria_name pizzeria.name%TYPE) AS $$
BEGIN
RETURN QUERY
    SELECT DISTINCT  pizzeria.name FROM person
        JOIN person_visits p_v ON person.id = p_v.person_id
        JOIN pizzeria ON pizzeria.id = p_v.pizzeria_id
        JOIN menu ON menu.pizzeria_id = pizzeria.id

        WHERE p_v.visit_date = pdate AND menu.price < pprice AND person.name = pperson;
END ;
$$ LANGUAGE PLPGSQL;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date2(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
