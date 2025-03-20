--  LAB 5 MULTIPLE TABLES

--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sale WHERE stock_item_id = 1014;
-- B 
SELECT sale.date, stock_item.stock_item_id FROM sale INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id WHERE sale.stock_item_id = 1014;

--  2
-- A 
SELECT * FROM sale WHERE employee_id = 111;
-- B
SELECT sale.date, employee.first_name, employee.last_name, sale.stock_item_id FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id WHERE sale.employee_id = 111;

--  3
-- A
SELECT sale.date, stock_item.name FROM sale INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id ORDER BY sale.date DESC LIMIT 5;
-- B
SELECT employee.first_name, employee.last_name, sale.date, stock_item.name, stock_item.price FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id ORDER BY sale.date DESC LIMIT 5;

--  4
-- A
SELECT sale.date, stock_item.name, employee.first_name FROM sale INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id INNER JOIN employee ON sale.employee_id = employee.employee_id WHERE sale.date BETWEEN '2025-01-12' AND '2025-01-18' ORDER BY sale.date;
-- B
SELECT employee.first_name, employee.last_name, COUNT(sale.sale_id) AS total_sales FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id GROUP BY employee.employee_id ORDER BY total_sales DESC;

--  5
-- A
SELECT s.date, si.name, si.price, si.category, e.first_name FROM sale AS s INNER JOIN employee AS e ON s.employee_id = e.employee_id INNER JOIN stock_item AS si ON s.stock_item_id = si.stock_item_id WHERE s.employee_id = ( SELECT s.employee_id FROM sale AS s GROUP BY s.employee_id ORDER BY COUNT(s.sale_id) DESC LIMIT 1 );
-- B
SELECT stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category, COUNT(sale.sale_id) AS times_sold FROM stock_item LEFT JOIN sale ON stock_item.stock_item_id = sale.stock_item_id GROUP BY stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category ORDER BY stock_item.stock_item_id;

--  6
-- A <Which employee processed the highest number of sales, and what are the total sales processed by each employee?>
-- B
SELECT employee.employee_id, employee.first_name, employee.last_name, COUNT(sale.sale_id) AS total_sales FROM employee INNER JOIN sale ON employee.employee_id = sale.employee_id GROUP BY employee.employee_id, employee.first_name, employee.last_name ORDER BY total_sales DESC;