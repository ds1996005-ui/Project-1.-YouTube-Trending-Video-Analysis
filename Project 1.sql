CREATE DATABASE youtube_project;
USE youtube_project;

CREATE TABLE youtube_trending (
    video_id VARCHAR(50),
    title TEXT,
    publishedAt DATETIME,
    channelId VARCHAR(100),
    channelTitle VARCHAR(255),
    categoryId INT,
    trending_date DATE,
    tags TEXT,
    view_count BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comment_count BIGINT,
    thumbnail_link TEXT,
    comments_disabled BOOLEAN,
    ratings_disabled BOOLEAN,
    description TEXT,
    country VARCHAR(10)
);

ALTER TABLE youtube_trending ADD COLUMN country VARCHAR(10);
LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/US_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'US';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/BR_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'BR';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/RU_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'RU';

LOAD DATA LOCAL INFILE 'C:\\Users\\HP\\Downloads\\project 1\\MX_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'MX';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/JP_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'JP';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/KR_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'KR';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/IN_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'IN';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/GB_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'GB';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/FR_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'FR';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/DE_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'DE';

LOAD DATA LOCAL INFILE 'C:/Users/HP/Downloads/project 1/CA_youtube_trending_data.csv'
INTO TABLE youtube_trending
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
SET country = 'CA';

USE youtube_project;
DELETE FROM youtube_trending
WHERE video_id = 'video_id';

SELECT DISTINCT country FROM youtube_trending;
DELETE FROM youtube_trending
WHERE country NOT IN ('US','BR','RU','MX','JP','KR','IN','GB','FR','DE','CA');

-- Total videos per country--
SELECT country, COUNT(*) AS total_videos
FROM youtube_trending
GROUP BY country
ORDER BY total_videos DESC;

-- Average views per country --
SELECT country, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('US','BR','RU','MX','JP')
GROUP BY country
ORDER BY avg_views DESC;
-- Average views per country --
SELECT country, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('KR','IN','GB','FR','DE','CA')
GROUP BY country
ORDER BY avg_views DESC;

-- Trending duration per country--
USE youtube_project;
SELECT country, video_id, COUNT(DISTINCT trending_date) AS days_trending
FROM youtube_trending
WHERE country IN ('US','BR')
GROUP BY country, video_id
ORDER BY days_trending DESC;

SELECT country, video_id, COUNT(DISTINCT trending_date) AS days_trending
FROM youtube_trending
WHERE country IN ('RU','MX','JP')
GROUP BY country, video_id
ORDER BY days_trending DESC;

SELECT country, video_id, COUNT(DISTINCT trending_date) AS days_trending
FROM youtube_trending
WHERE country IN ('KR','IN','GB')
GROUP BY country, video_id
ORDER BY days_trending DESC;

SELECT country, video_id, COUNT(DISTINCT trending_date) AS days_trending
FROM youtube_trending
WHERE country IN ('FR','DE')
GROUP BY country, video_id
ORDER BY days_trending DESC;

SELECT country, video_id, COUNT(DISTINCT trending_date) AS days_trending
FROM youtube_trending
WHERE country IN ('CA')
GROUP BY country, video_id
ORDER BY days_trending DESC;

-- Category analytics 3.SQL Analytics — Rank Categories by Avg Views --
USE youtube_project;
-- Batch 1
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('US','BR')
GROUP BY categoryId
ORDER BY avg_views DESC;

-- Batch 2
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country = 'RU'
GROUP BY categoryId
ORDER BY avg_views DESC;

SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country = 'MX'
GROUP BY categoryId
ORDER BY avg_views DESC;

-- Batch 3
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country = 'JP'
GROUP BY categoryId
ORDER BY avg_views DESC;

SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country = 'KR'
GROUP BY categoryId
ORDER BY avg_views DESC;


-- Batch 4 
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('IN')
GROUP BY categoryId
ORDER BY avg_views DESC;

SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('GB')
GROUP BY categoryId
ORDER BY avg_views DESC;


-- Batch 5
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('FR')
GROUP BY categoryId
ORDER BY avg_views DESC;

SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('DE')
GROUP BY categoryId
ORDER BY avg_views DESC;
-- Batch 6
SELECT categoryId, AVG(view_count) AS avg_views
FROM youtube_trending
WHERE country IN ('CA')
GROUP BY categoryId
ORDER BY avg_views DESC;











