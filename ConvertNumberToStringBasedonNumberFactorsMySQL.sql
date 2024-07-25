CREATE TABLE factors (
    number INT,
    factor INT
);

DELIMITER //

CREATE PROCEDURE convert_number_to_string(IN input_number INT, OUT result_string VARCHAR(255))
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE factor_list VARCHAR(255) DEFAULT '';
    DECLARE is_first BOOLEAN DEFAULT TRUE;

    -- Clear previous factors
    DELETE FROM factors WHERE number = input_number;

    -- Find and store factors
    WHILE i <= input_number DO
        IF input_number % i = 0 THEN
            INSERT INTO factors (number, factor) VALUES (input_number, i);
            -- Append to factor list
            IF is_first THEN
                SET factor_list = CAST(i AS CHAR);
                SET is_first = FALSE;
            ELSE
                SET factor_list = CONCAT(factor_list, ', ', i);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Set the result string
    SET result_string = factor_list;
END //

DELIMITER ;

SELECT prime_number
FROM primes
ORDER BY id
LIMIT 1 OFFSET n - 1;


