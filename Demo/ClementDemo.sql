-- clement
CREATE TABLE IF NOT EXISTS domain(
  domain_id SERIAL PRIMARY KEY,
  domain_suffix VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS category(
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(30) NOT NULL,
  domain_id INT NOT NULL,
  FOREIGN KEY (domain_id) REFERENCES domain(domain_id)
);


CREATE OR REPLACE FUNCTION setDomain(role VARCHAR(30))
  RETURNS TABLE(
    catid   INTEGER,
    catname VARCHAR(30),
    domain_id     INTEGER,
    domain_suffix VARCHAR(30)
  ) AS
$$
DECLARE
  domainid       INT;
  countduplicate INT;
BEGIN
  SELECT count(category_name) INTO countduplicate
  FROM category WHERE category_name = role;

  RAISE NOTICE '%', countduplicate;

  IF countduplicate = 0 THEN
    INSERT INTO domain(domain_suffix) VALUES
      (concat(role, '.pas.org'));
    SELECT domain.domain_id INTO domainid FROM domain WHERE domain.domain_suffix = concat(role, '.pas.org');
    INSERT INTO category(category_name, domain_id) VALUES (role, domainid);
  ELSE
    RAISE NOTICE 'Duplicate Entry';

  END IF;

  RETURN QUERY SELECT category_id, category_name, domain_id, domain_suffix FROM domain INNER JOIN category USING (domain_id);
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS setDomain(role VARCHAR(30));

SELECT * FROM setDomain('students')