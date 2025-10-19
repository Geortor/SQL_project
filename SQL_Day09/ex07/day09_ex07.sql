CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS integer AS $$
DECLARE
    x INTEGER;
    min integer;
BEGIN  
    FOREACH x IN ARRAY arr LOOP
        IF x IS NOT NULL and (min IS NULL OR x < min) THEN
            min := x;
        END IF;
    END LOOP;
    RETURN min;
END;
$$ LANGUAGE PLPGSQL;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

