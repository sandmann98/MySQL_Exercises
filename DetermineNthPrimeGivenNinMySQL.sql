CREATE TABLE primes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prime_number INT
);

DELIMITER //

CREATE PROCEDURE generate_primes(n INT)
BEGIN
    DECLARE num INT DEFAULT 2;
    DECLARE count INT DEFAULT 0;
    DECLARE is_prime BOOLEAN;
    DECLARE i INT;

    -- Clear the table before inserting
    DELETE FROM primes;

    -- Find primes
    WHILE count < n DO
        SET is_prime = TRUE;
        SET i = 2;

        -- Check if num is a prime number
        WHILE i * i <= num DO
            IF num % i = 0 THEN
                SET is_prime = FALSE;
                LEAVE;
            END IF;
            SET i = i + 1;
        END WHILE;

        IF is_prime THEN
            INSERT INTO primes (prime_number) VALUES (num);
            SET count = count + 1;
        END IF;

        SET num = num + 1;
    END WHILE;
END //

DELIMITER ;

CALL generate_primes(100);  -- Change 100 to the desired value of n

SELECT prime_number
FROM primes
ORDER BY id
LIMIT 1 OFFSET n - 1;

