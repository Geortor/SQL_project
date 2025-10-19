  CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
  RETURNS TRIGGER
  AS $$
  BEGIN
      IF (TG_OP = 'DELETE') THEN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (DEFAULT, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN OLD;
      ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (DEFAULT, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NEW;
      ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address)
    VALUES (DEFAULT, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
    END IF;
  END;
  $$ LANGUAGE PLPGSQL;

  CREATE TRIGGER trg_person_audit  
  AFTER DELETE OR UPDATE OR INSERT ON person
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_person_audit();
  


------------

DROP FUNCTION fnc_trg_person_delete_audit() CASCADE;
DROP FUNCTION fnc_trg_person_insert_audit() CASCADE;
DROP FUNCTION fnc_trg_person_update_audit() CASCADE;

------------

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;