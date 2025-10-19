-- Active: 1737051226311@@127.0.0.1@5432@TEAM00
with temp as (
    select menu.id as menu_id, pizzeria_id
    from menu
    join pizzeria on menu.pizzeria_id = pizzeria.id
    group by pizzeria_id, menu_id
)
insert into person_discounts(id, person_id, pizzeria_id, discount)
select row_number() over() as id , person_id, pizzeria_id,
(
case
    when count(person_order.person_id) = 1 then 10.5
    when count(person_order.person_id) = 2 then 22
    else  30
end
) as discount
from person_order
join temp on temp.menu_id = person_order.menu_id
group by person_order.person_id, temp.pizzeria_id
order by person_id;
