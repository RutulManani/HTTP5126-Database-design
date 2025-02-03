-- LAB 3 FILTER DATA
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

--  1 
-- A 
SELECT * FROM employee WHERE role = 'Manager' or role = 'Assistant';
-- B
SELECT * FROM stock_item WHERE category = 'Piscine' AND inventory <24;

--  2
-- A
SELECT item, inventory FROM stock_item WHERE item like '%cage%';
-- B
SELECT * FROM employee WHERE first_name like 'F%';

--  3
-- A
SELECT * FROM stock_item WHERE stock_item_id BETWEEN '1010'AND '1015';
-- B
SELECT item, price FROM stock_item WHERE price BETWEEN '10' AND '20' AND category = 'canine';

--  4
-- A
SELECT first_name, last_name, phone FROM employee WHERE NOT (role = 'Manager' OR role = 'Assistant');
-- B
SELECT item, price, inventory FROM stock_item WHERE NOT (category = 'Feline' OR category = 'Canine') AND inventory<20;

--  5
-- A
SELECT first_name, last_name, role, phone FROM employee ORDER BY last_name;
-- B
SELECT stock_item_id, item, price, inventory FROM stock_item WHERE category = 'murine' AND inventory > 20 ORDER BY price DESC;