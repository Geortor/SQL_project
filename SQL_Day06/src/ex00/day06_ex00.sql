-- Active: 1737051226311@@127.0.0.1@5432@TEAM00
create table person_discounts
(
    id bigint primary key ,
    person_id  bigint not null ,
    pizzeria_id bigint not null ,
    discount numeric not null default 1,
    constraint fk_order_person_id foreign key (person_id) references person(id),
    constraint fk_order_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
);