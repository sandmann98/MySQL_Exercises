CREATE TABLE chessboard (
    square INT PRIMARY KEY,
    grains BIGINT
);
DELIMITER //

CREATE PROCEDURE calculate_grains()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE grain_count BIGINT DEFAULT 1;

    -- Clear the table before inserting
    DELETE FROM chessboard;

    -- Loop through 64 squares
    WHILE i <= 64 DO
        INSERT INTO chessboard (square, grains)
        VALUES (i, grain_count);

        -- Double the grains for the next square
        SET grain_count = grain_count * 2;
        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;

CALL calculate_grains();

SELECT * FROM chessboard;


