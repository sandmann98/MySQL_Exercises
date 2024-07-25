SET @N = 10;  -- Replace with your desired value of N

-- Calculate the sum of the first N natural numbers
SET @sum_n = (N * (N + 1)) / 2;

-- Calculate the sum of the squares of the first N natural numbers
SET @sum_squares_n = (N * (N + 1) * (2 * N + 1)) / 6;

-- Calculate the square of the sum of the first N natural numbers
SET @square_of_sum = @sum_n * @sum_n;

-- Calculate the difference between the square of the sum and the sum of the squares
SELECT @square_of_sum - @sum_squares_n AS difference;


