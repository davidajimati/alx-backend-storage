-- SQL script that creates a function SafeDiv that divides (and returns) the first by
-- the second number or returns 0 if the second number is equal to 0.

DELIMITER //
DROP FUNCTION IF EXISTS SafeDiv;
CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
BEGIN
    DECLARE answer FLOAT;
    IF b <> 0 THEN
        SET answer =  a / b;
    ELSE
        SET answer = 0;
    END IF;
        RETURN answer;
END;
//

DELIMITER ;

