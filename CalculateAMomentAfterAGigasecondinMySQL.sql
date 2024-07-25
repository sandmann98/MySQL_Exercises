-- Replace '2024-01-01 00:00:00' with your specific datetime value
SET @initial_moment = '2024-01-01 00:00:00';

-- A gigasecond is 1,000,000,000 seconds
SET @gigasecond = 1000000000;

-- Calculate the moment after a gigasecond
SELECT
    @initial_moment AS initial_moment,
    FROM_UNIXTIME(UNIX_TIMESTAMP(@initial_moment) + @gigasecond) AS moment_after_gigasecond;

