DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();
----------------
CREATE OR REPLACE FUNCTION fnc_persons (pgender VARCHAR DEFAULT 'female')
RETURNS TABLE(id INTEGER, name text, age INTEGER, gender TEXT, address TEXT) AS $$
    SELECT * FROM person WHERE gender = $1
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
