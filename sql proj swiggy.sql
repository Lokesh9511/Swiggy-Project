show databases;
use lokesh;
show tables;
select *from swiggy;




RENAME TABLE `swiggy_hyd_data` TO `swiggy`;

alter table swiggy
change column `Delivery time` Delivery_time int;

alter table swiggy
change column `Total ratings` Total_ratings int;

alter table swiggy
change column `Avg ratings` Avg_ratings float;


-- 1. Find the total number of restaurants in each city.
-- Explanation: This query counts the number of unique restaurants in each city.

SELECT City, COUNT(DISTINCT Restaurant) AS TotalRestaurants
FROM swiggy
GROUP BY City;

-- 2. List the top 10 areas with the highest average ratings.
-- Explanation: This query calculates the average ratings for each restaurant,area and displays the top 5 areas with the highest average ratings.

SELECT restaurant,Area, AVG(Avg_ratings) AS AverageRating
FROM swiggy
GROUP BY restaurant,Area
ORDER BY AverageRating DESC
limit 10;

-- 3.Identify the most popular food type in each city.
-- Explanation: This query shows the most popular food types in each city based on the number of orders

SELECT City, Food_type, COUNT(*) AS OrderCount
FROM swiggy
GROUP BY City, Food_type
ORDER BY OrderCount DESC;

-- 4.List the areas where the average delivery time is above 60 minutes.
-- Explanation: This query identifies areas with an average delivery time exceeding 60 minutes.

 SELECT Area, AVG(Delivery_time) AS AverageDeliveryTime
FROM swiggy
GROUP BY Area
HAVING AverageDeliveryTime > 60;


-- 5.Find the restaurant wise  total sales.
-- Explanation: This query identifies the restaurant with the top 3 total sales.

SELECT Restaurant, SUM(Price) AS TotalSales
FROM swiggy
GROUP BY Restaurant
ORDER BY TotalSales DESC
;


-- 6.List the food types that have an average rating above 4.0.
-- Explanation: This query identifies food types with an average rating above 4.0.

SELECT Food_type, AVG(Avg_ratings) AS AverageRating
FROM swiggy
GROUP BY Food_type
HAVING AverageRating > 4.0
ORDER BY AverageRating DESC; 

-- 7.Find the area with the highest total sales.
-- Explanation: This query identifies the area with the highest total sales.

SELECT Area, SUM(Price) AS TotalSales
FROM swiggy
GROUP BY Area
ORDER BY TotalSales DESC
LIMIT 1;

-- 8.Count the number of restaurants that offer desserts in each area.
-- Explanation: This query counts the number of restaurants offering desserts in each city.

SELECT area, COUNT(DISTINCT Restaurant) AS RestaurantsWithDesserts
FROM swiggy
WHERE Food_type LIKE '%Desserts%'
GROUP BY area
order by RestaurantsWithDesserts desc;




------------------------------------------------------------------------------------------------------------------------------------------------------

-- 9.Identify the restaurants that offer the widest variety of food types (highest count of distinct food types).

SELECT Restaurant, COUNT(DISTINCT Food_type) AS VarietyCount
FROM swiggy
GROUP BY Restaurant
ORDER BY VarietyCount DESC
;




