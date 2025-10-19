CREATE SEQUENCE seq_person_discounts START 1;
ALTER TABLE person_discounts alter column id SET DEFAULT NEXTVAL('seq_person_discounts');

SELECT SETVAL('seq_person_discounts', (SELECT count(*)+1 FROM person_discounts));