CREATE FUNCTION fnc_persons_female()
RETURNS TABLE(id INTEGER, name text, age INTEGER, gender TEXT, address TEXT) AS $$
    SELECT * FROM person WHERE gender = 'female'
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_female();

------------

CREATE FUNCTION fnc_persons_male()
RETURNS TABLE(id INTEGER, name text, age INTEGER, gender TEXT, address TEXT) AS $$
    SELECT * FROM person WHERE gender = 'male'
$$ LANGUAGE SQL;

SELECT *
FROM fnc_persons_male();