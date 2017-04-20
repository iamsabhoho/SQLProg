-- andrew
-- calculate if the students has improved overall

CREATE OR REPLACE FUNCTION improve(score INT)
  RETURNS BOOLEAN AS
$$
DECLARE
  prevAve DECIMAL;
  sum     INTEGER;
  cnt     INTEGER;
  num     INTEGER;
BEGIN

  cnt := 0;
  sum := 0;
  FOR num IN SELECT *
             FROM randTable(5)
  LOOP
    cnt := cnt + 1;
    sum := sum + num;
  END LOOP;
  prevAve := sum / cnt;
  IF score > prevAve
  THEN
    RAISE NOTICE 'The student has improved';
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS randTable(numValue INT);

CREATE OR REPLACE FUNCTION randTable(numValue INT)
  RETURNS TABLE(
  number DECIMAL
  )AS
  $$
BEGIN
FOR x in 0..numValue LOOP
  number := TRUNC(random()*100);
  RETURN NEXT;
END LOOP;
END;
$$LANGUAGE plpgsql;

SELECT * FROM improve(100);