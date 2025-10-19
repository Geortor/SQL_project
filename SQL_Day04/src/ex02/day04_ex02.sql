CREATE VIEW v_generated_dates AS
SELECT date::date FROM generate_series ( '2022-01-01'::TIMESTAMP, '2022-01-31'::TIMESTAMP, '1 day') AS date