CREATE FUNCTION product(a INTEGER, b INTEGER)
  RETURNS INTEGER AS
  $$
  BEGIN
    RETURN a * b;
  END;
  $$ LANGUAGE plpgsql; -- programming language postgres sql

SELECT product(4,5);

-- create fibonacci function recursive 
CREATE FUNCTION fibo(num_terms INTEGER)
  RETURNS INTEGER AS 
  $$
  BEGIN 
    IF num_terms < 2 THEN 
      RETURN num_terms; 
    ELSE 
      RETURN fibo(num_terms-2) + fibo(num_terms-1); 
    END IF;
      
  END;
  $$ LANGUAGE plpgsql;

SELECT fibo(6);

CREATE FUNCTION combinedWord(a TEXT, b TEXT)
  RETURNS TEXT AS
  $$
  BEGIN
    RETURN concat(initcap(a), ' ', initcap(b));
  END;
  $$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS combinedWord();

SELECT combinedWord('sabrina', 'ho');

CREATE FUNCTION emailname(firstname TEXT, lastname TEXT, domain TEXT DEFAULT 'pas.org')
  RETURNS TEXT AS
  $$
  BEGIN
    RETURN concat(substr(firstname, 1, 1), '.', lastname, '@', domain);
  END;
  $$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS emailname(firstname TEXT, lastname TEXT, domain TEXT);

SELECT emailname('sabrina', 'ho');

CREATE FUNCTION myMIMO(a INTEGER, b INTEGER, c INTEGER,
  OUT total INTEGER, OUT maxi INTEGER) AS
  $$
  BEGIN
    total := a + b + c;
    maxi := greatest(a, b, c);
  END;
  $$ LANGUAGE plpgsql;

SELECT * from myMIMO(5, 7, 3);

CREATE FUNCTION getName(firstnameIn TEXT, email TEXT,
  OUT firstnameOut TEXT, OUT lastname TEXT, OUT domain TEXT)
  RETURNS TEXT AS
  $$
  BEGIN

    domain := split_part(email, '@', 2);
    lastname := split_part(email, '.', 2);
    firstnameOut := firstnameOut;

    RETURN firstnameOut, lastname, domain;
  END;
  $$ LANGUAGE plpgsql;

drop FUNCTION IF EXISTS getName(firstname TEXT, email TEXT);

SELECT getName('sabrina', emailname('sabrina', 'ho'));

DROP FUNCTION IF EXISTS public.ave_total(NUMERIC[]);
CREATE FUNCTION Ave_Total(Variadic inputs NUMERIC [], OUT total INTEGER, OUT average FLOAT) AS
$$
DECLARE
  r INTEGER;
BEGIN
  total := 0;
  average := 0;
  FOR r IN SELECT unnest(inputs)
  LOOP
    RAISE NOTICE' %', r;
    total := total + r;
    average := average + 1;
  END LOOP;
  average := total / average;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_staff(city_pattern VARCHAR)
  RETURNS TABLE(
    name TEXT,
    age INT
  )
  AS $$
BEGIN
  RETURN QUERY SELECT upper(COMPANY.NAME), COMPANY.AGE
  FROM COMPANY WHERE COMPANY.ADDRESS LIKE city_pattern;
END;
  $$LANGUAGE 'plpgsql';



CREATE FUNCTION loop1(x INTEGER)
  RETURNS VOID AS
  $$
  BEGIN
    FOR cnt IN 1..x LOOP
      RAISE NOTICE 'Counter value is: %', cnt;
    END LOOP;
  END;
  $$LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS loop1(x INTEGER);

SELECT loop1(10);

CREATE FUNCTION loop2(x INTEGER)
  RETURNS VOID AS
$$
BEGIN
  FOR cnt IN 1..x LOOP
    RAISE NOTICE 'Counter value is: %', cnt;
  END LOOP;
END;
$$LANGUAGE plpgsql;