CREATE DATABASE PIZZA_STORE;
USE PIZZA_STORE;

SELECT * FROM pizza_store.order_details;
SELECT * FROM pizza_store.orders;
SELECT * FROM pizza_store.pizza_types;
SELECT * FROM pizza_store.pizzas;

DROP TABLE pizza_store.orders;


CREATE TABLE orders (
 order_id int primary key,
 order_date date not null,
 order_time time not null);
 
SELECT * FROM pizza_store.order_details;
SELECT * FROM pizza_store.orders;
SELECT * FROM pizza_store.pizza_types;
SELECT * FROM pizza_store.pizzas;
 
 -- Basic:
-- 1 Retrieve the total number of orders placed.
SELECT COUNT(*) AS TOTAL_ORDER FROM pizza_store.orders;

-- 2 Calculate the total revenue generated from pizza sales.
SELECT SUM(order_details.quantity * pizzas.price) AS TOTAL_REVENUE
FROM order_details JOIN
pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- 3 Identify the highest-priced pizza AND pizza name.
SELECT pizza_types.category, pizzas.price FROM pizza_types JOIN
pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY price DESC limit 1;

-- Identify the most common pizza size ordered.
SELECT pizzas.size , COUNT(order_details.order_details_id) AS ORDER_COUNT FROM
order_details JOIN pizzas ON
order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size ORDER BY ORDER_COUNT DESC;

-- List the top 5 most ordered pizza types along with their quantities.
SELECT pizza_types.category,
SUM(order_details.quantity) AS QUANTITY
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category ORDER BY QUANTITY DESC limit 5;




















