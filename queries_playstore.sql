-- Comments in SQL Start with dash-dash --
-- App with 1880 ID --
SELECT * From analytics Where id = 1880; 

-- Latest updated app in august 1st 2018
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';

-- Categories of APP counted --
SELECT category, COUNT(*) as count FROM analytics GROUP BY category ORDER BY count DESC;

-- Top 5 reviewed Apps ---
SELECT app_name, reviews From analytics ORDER BY reviews DESC LIMIT 5;

-- Apps with highest review rating 
SELECT app_name, reviews From analytics WHERE rating >= 4.8 LIMIT 1;

-- Apps with highest review rating 
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;

--Most expensive app with rating < 3
SELECT app_name, price, rating FROM analytics  WHERE rating < 3  ORDER BY price DESC LIMIT 1;

-- Apps with min_installs <= 50 that have a rating, ordered by rating
SELECT app_name, rating, min_installs FROM analytics WHERE min_installs <= 50 
  AND rating IS NOT NULL
ORDER BY rating DESC;

-- Apps rated < 3 with at least 10000 reviews
SELECT app_name, rating, reviews FROM analytics
WHERE rating < 3 
  AND reviews >= 10000;

-- Top 10 most-reviewed apps costing between $0.10 and $1.00
SELECT app_name, price, reviews FROM analytics WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

-- Find the most out-of-date app
SELECT app_name, last_updated FROM apps WHERE last_updated = (SELECT MIN(last_updated) FROM apps);

-- Find the most expensive app
SELECT app_name, price FROM apps WHERE price = (SELECT MAX(price) FROM apps);

--Count all the reviews in the Google Play Store
SELECT SUM(reviews) AS total_reviews FROM apps;

-- Find all the categories that have more than 300 apps
SELECT category FROM apps GROUP BY category HAVING COUNT(*) > 300;

-- Find the app with the highest proportion of min_installs to reviews
SELECT app_name, reviews, min_installs, 
       (min_installs::FLOAT / reviews) AS install_review_ratio
FROM apps
WHERE min_installs >= 100000
ORDER BY install_review_ratio DESC
LIMIT 1;