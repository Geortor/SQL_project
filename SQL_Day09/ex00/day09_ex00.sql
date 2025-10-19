-- Active: 1737051226311@@127.0.0.1@5432@TEAM00
create table person_audit
( created timestamp with time zone  DEFAULT CURRENT_TIMESTAMP NOT NULL,
  type_event char(1) NOT NULL DEFAULT 'I'
  CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D')),
  row_id BIGINT NOT NULL, ---primary key???
  name varchar not null,
  age integer not null default 10,
  gender varchar default 'female' not null ,
  address varchar
  );

  CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
  RETURNS TRIGGER
  AS $$
  BEGIN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (DEFAULT, DEFAULT, NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
  END;
  $$ LANGUAGE PLPGSQL;

  CREATE TRIGGER trg_person_insert_audit
  AFTER INSERT ON person
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_person_insert_audit();
  
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');