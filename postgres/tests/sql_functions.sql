CREATE DATABASE data;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email varchar(25) UNIQUE,
  name varchar(25),
  password varchar(255)
);

INSERT INTO data.public.users (email, name, password) VALUES ('ajones@mail.com', 'Adam Jones', '123');

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
