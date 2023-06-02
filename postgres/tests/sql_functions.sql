CREATE DATABASE data;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email varchar(25) UNIQUE,
  name varchar(25),
  password varchar(255)
);

INSERT INTO data.public.users (email, name, password) VALUES ('ajones@mail.com', 'Adam Jones', '123');

CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  movie_name varchar(25),
  year_released INT
);

INSERT INTO data.public.movies (movie_name, year_released) VALUES ('Movie F', 2007);

-- добавить столбец
ALTER TABLE data.public.movies
ADD COLUMN another INT;
-- удалить столбец
ALTER TABLE data.public.movies
DROP COLUMN another;
----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_mid(VARCHAR, INTEGER, INTEGER)
RETURNS VARCHAR
AS
$$
BEGIN
   RETURN substr($1, $2, $3);
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_mid('software', 5, 3);

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_mid1(VARCHAR, INTEGER, INTEGER)
RETURNS VARCHAR
AS
$$
DECLARE
    word ALIAS FOR $1;
    startPosition ALIAS FOR $2;
    count ALIAS FOR $3;
BEGIN
   RETURN substr(word, startPosition, count);
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_mid1('15948741', 5, 3);

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fn_mid2(buffer VARCHAR, start INTEGER, length INTEGER)
RETURNS VARCHAR
AS
$$
BEGIN
   RETURN substr(buffer, start, length);
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_mid2('1111222', 1, 2);

----------------------------------------------------------------------------------------------------------

-- ФУНКЦИЯ:

-- CREATE OR REPLACE FUNCTION funcName(fieldName DATATYPE)
-- RETURNS <RETURN_DATATYPE>
-- AS
-- $$
-- BEGIN
--     <FUNCTION BODY HERE>
-- END;
-- $$
-- LANGUAGE plpgsql;

-- УСЛОВИЯ:

-- IF <condition> THEN
--     <statements>
-- ELSIF <condition> THEN
--     <statements>
-- ELSE
--     <statements>
-- END IF;
----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fnMakeFull(firstName VARCHAR, lastName VARCHAR)
RETURNS VARCHAR
AS
$$
BEGIN
    IF firstName IS NULL AND lastName IS NULL THEN
        RETURN NULL;
    ELSIF firstName IS NULL AND lastName IS NOT NULL THEN
        RETURN lastName;
    ELSE
        RETURN concat_ws(' ', firstName, lastName);
        -- RETURN firstName || ' ' || lastName;
        -- RETURN concat(firstName, ' ', lastName);
    END IF;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnMakeFull( 'Iaroslav', 'Os');

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fnMakeFullCap(firstName VARCHAR, lastName VARCHAR)
RETURNS VARCHAR
AS
$$
BEGIN
    IF firstName IS NULL AND lastName IS NULL THEN
        RETURN NULL;
    ELSIF firstName IS NULL AND lastName IS NOT NULL THEN
        RETURN lastName;
    ELSE
        RETURN concat_ws(' ', initcap(firstName), initcap(lastName));
        -- RETURN firstName || ' ' || lastName;
        -- RETURN concat(firstName, ' ', lastName);
    END IF;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnMakeFullCap( 'iaroslav', 'os');

----------------------------------------------------------------------------------------------------------

-- PARAMETER TYPE { IN* | OUT | INOUT | VARIADIC** } **DEFAULT **VARIABLE NUMBER OF ARGUMENTS

-- CREATE OR REPLACE FUNCTION funcName(PARAMETER TYPE fieldName DATATYPE)
-- AS
-- $$
-- BEGIN
--     <FUNCTION BODY HERE>
-- END;
-- $$
-- LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fnSwap(INOUT number1 INT, INOUT number2 INT)
AS
$$
BEGIN
   SELECT number1, number2 INTO number2, number1;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnSwap(10, 20);
SELECT fnSwap(10, 20);

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fnMean(numbers NUMERIC[])
RETURNS NUMERIC
AS
$$
DECLARE total NUMERIC := 0;
        value NUMERIC;
        count INT := 0;
        n_array ALIAS FOR numbers;
BEGIN
    FOREACH value IN ARRAY n_array
    LOOP
        total := total + value;
        count := count + 1;
    END LOOP;
    RETURN total/count;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnMean(ARRAY [1, 1, 2, 1]);

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fnGetMoviesByYear(year INT)
RETURNS TABLE
(
    movie_id INT,
    movie_name varchar(25),
    year_released INT
)
AS
$$
BEGIN
    RETURN QUERY
    SELECT
        mv.movie_id,
        mv.movie_name,
        mv.year_released
    FROM data.public.movies AS mv
    WHERE mv.year_released >= year;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnGetMoviesByYear(2000);

----------------------------------------------------------------------------------------------------------

DROP FUNCTION fninquerytest(text);

CREATE OR REPLACE FUNCTION fnInQueryTest(IN myQuery TEXT, OUT result INT, OUT txt TEXT)
AS
$$
DECLARE row RECORD;
BEGIN
    result := 0;
    FOR row IN EXECUTE myQuery
    LOOP
        result := result + row.year_released;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM fnInQueryTest('SELECT * FROM data.public.movies');

----------------------------------------------------------------------------------------------------------

DROP FUNCTION fninquerytest2(text);

CREATE OR REPLACE FUNCTION fnInQueryTest2(OUT result INT)
AS
$$
DECLARE row RECORD;
BEGIN
    result := 0;
    FOR row IN SELECT * FROM data.public.movies
    LOOP
        result := result + row.year_released;
    END LOOP;
END
$$
LANGUAGE plpgsql;

SELECT * FROM fnInQueryTest2();

----------------------------------------------------------------------------------------------------------

DROP FUNCTION fnTestCast;

CREATE OR REPLACE FUNCTION fnTestCast(OUT result TEXT)
AS
$$
BEGIN
    result := cast(123.32 AS FLOAT) ;
END
$$
LANGUAGE plpgsql;

SELECT * FROM fnTestCast();

----------------------------------------------------------------------------------------------------------

CREATE TABLE temp (
  id SERIAL PRIMARY KEY,
  djson JSONB
);

INSERT INTO temp (djson) VALUES ('{}');
UPDATE temp SET djson = '{"data":"123"}' WHERE id = 1;
SELECT * FROM temp WHERE id = 1;

----------------------------------------------------------------------------------------------------------