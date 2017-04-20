-- Sabrina
-- finding failing number

CREATE FUNCTION failingNum(VARIADIC inputs NUMERIC [])
  RETURNS INTEGER AS
$$
DECLARE
  score INTEGER;
  cnt   INTEGER := 0;
BEGIN

  FOR score IN SELECT unnest(inputs)
  LOOP
    IF score < 60
    THEN
      cnt := cnt + 1;
    END IF;
  END LOOP;
  RAISE NOTICE 'The number of failing grades: %', cnt;
  RETURN cnt;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS failingNum( VARIADIC inputs NUMERIC [] );

SELECT *
FROM failingNum(56, 79, 44, 90, 23)