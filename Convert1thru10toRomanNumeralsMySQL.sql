CREATE TABLE arabic_to_roman (
    arabic INT PRIMARY KEY,
    roman VARCHAR(10)
);

INSERT INTO arabic_to_roman (arabic, roman) VALUES
(1, 'I'),
(2, 'II'),
(3, 'III'),
(4, 'IV'),
(5, 'V'),
(6, 'VI'),
(7, 'VII'),
(8, 'VIII'),
(9, 'IX'),
(10, 'X');

SELECT roman
FROM arabic_to_roman
WHERE arabic = 7;



