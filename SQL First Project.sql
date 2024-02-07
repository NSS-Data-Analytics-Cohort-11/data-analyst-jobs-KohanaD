SELECT *
FROM data_analyst_jobs;

--1. How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs;

--Answer: 1793

--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT company 
FROM data_analyst_jobs
LIMIT 10;

--Answer: ExxonMobil

--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT location
FROM data_analyst_jobs
WHERE location IN ('TN');

SELECT location 
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

--AnswerPT1: 21
--AnswerPT2: 27

--4. How many postings in Tennessee have a star rating above 4?

SELECT COUNT(star_rating)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

--Answer: 3

--5. How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--Answer: 151

--6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT DISTINCT(location) AS State, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL AND location IS NOT NULL
GROUP BY location
ORDER BY AVG(star_rating) DESC;

--Answer: NE 

--7. Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

--Answer: 881

--8. How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';

--Answer: 230

--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS avg_star_rating, review_count
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company, review_count
ORDER BY company;

SELECT COUNT(DISTINCT(company))
FROM data_analyst_jobs
WHERE review_count > 5000;

--AnswerPt1: Umm not sure how to answer this one here but the code should be correct :D
--AnswerPt2: 40






