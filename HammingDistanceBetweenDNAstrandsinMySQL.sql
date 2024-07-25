DELIMITER //

CREATE PROCEDURE CalculateHammingDistance(
    IN dna_strand1 VARCHAR(255),
    IN dna_strand2 VARCHAR(255),
    OUT hamming_distance INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE len1 INT;
    DECLARE len2 INT;
    DECLARE diff_count INT DEFAULT 0;
    
    -- Get the lengths of the DNA strands
    SET len1 = CHAR_LENGTH(dna_strand1);
    SET len2 = CHAR_LENGTH(dna_strand2);
    
    -- Check if both strands are of the same length
    IF len1 != len2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DNA strands must be of the same length';
    END IF;
    
    -- Iterate through each nucleotide and compare
    WHILE i <= len1 DO
        IF SUBSTRING(dna_strand1, i, 1) != SUBSTRING(dna_strand2, i, 1) THEN
            SET diff_count = diff_count + 1;
        END IF;
        SET i = i + 1;
    END WHILE;
    
    -- Return the Hamming distance
    SET hamming_distance = diff_count;
END //

DELIMITER ;

SET @dna1 = 'GAGCCTACTAACGGGAT';
SET @dna2 = 'CATCGTAATGACGGCCT';
SET @distance = 0;

CALL CalculateHammingDistance(@dna1, @dna2, @distance);

SELECT @distance AS HammingDistance;


