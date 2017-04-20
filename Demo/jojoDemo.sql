-- jojo
--- finding outliers

CREATE OR REPLACE FUNCTION findOutliers(VARIADIC inputs NUMERIC [])
  RETURNS SETOF NUMERIC AS
$$
DECLARE
  firstQ NUMERIC;
  thirdQ NUMERIC;
  IQR    NUMERIC;
  n      NUMERIC;
  num    INTEGER;
  arr    NUMERIC [];
BEGIN
  num := 0;
  FOR n IN SELECT unnest(inputs) AS x
           ORDER BY x LOOP
    arr [num] := n;
    num := num + 1;
  END LOOP; -- order array from least to greatest

  IF num % 2 = 0
  THEN
    IF (num / 2) % 2 = 0
    THEN
      firstQ := (arr [num / 4 + 1] + arr [num / 4]) / 2.0;
      thirdQ := (arr [num * 3 / 4 - 1] + arr [num * 3 / 4]) / 2.0;
    ELSE
      firstQ := arr [(num / 2 - 1) / 2];
      thirdQ := arr [(num / 2 - 1)/2 + num / 2];
    END IF;
  ELSE
    IF ((num - 1) / 2) % 2 = 0
    THEN
      firstQ:= (arr [(num - 1) / 4 - 1] + arr [(num - 1) / 4]) / 2.0;
      thirdQ:= (arr [(num - 1) * 3 / 4] + arr [(num - 1) * 3 / 4] + 1) / 2.0;
    ELSE
      firstQ := arr [((num - 1) / 2 - 1) / 2];
      thirdQ := arr [((num - 1) / 2 - 1) / 2 + (num - 1) / 2 + 1];
    END IF;
  END IF;
  RAISE NOTICE '%, %, %', firstQ, thirdQ, num;
  IQR := thirdQ - firstQ;
  FOR n IN SELECT unnest(arr) LOOP
    IF n < firstQ - 1.5*IQR OR n > thirdQ + 1.5*IQR THEN
      RETURN NEXT n;
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS findOutliers(VARIADIC inputs NUMERIC []);

SELECT findOutliers(1, 1, -20, 1, 1, 1, 12)

