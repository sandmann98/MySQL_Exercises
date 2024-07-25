CREATE TABLE dna_strands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dna_sequence VARCHAR(255)
);

INSERT INTO dna_strands (dna_sequence) VALUES ('ATCG');  -- Example DNA strand

DELIMITER //

CREATE FUNCTION dna_to_rna(dna_sequence VARCHAR(255)) 
RETURNS VARCHAR(255)
BEGIN
    DECLARE rna_sequence VARCHAR(255);
    SET rna_sequence = dna_sequence;

    -- Replace each base with its RNA complement
    SET rna_sequence = REPLACE(rna_sequence, 'A', 'U');
    SET rna_sequence = REPLACE(rna_sequence, 'T', 'A');
    SET rna_sequence = REPLACE(rna_sequence, 'C', 'G');
    SET rna_sequence = REPLACE(rna_sequence, 'G', 'C');
    
    RETURN rna_sequence;
END //

DELIMITER ;

SELECT dna_to_rna(dna_sequence) AS rna_transcription
FROM dna_strands
WHERE id = 1;  -- Replace with the desired row id

