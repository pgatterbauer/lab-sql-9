USE sakila;
# - Create a table `rentals_may` to store the data from rental table with information for 
# the month of May.
# Insert values in the table `rentals_may` using the table rental, 
# filtering values only for the month of May.

CREATE TABLE
	sakila.rentals_may 
AS (SELECT 
		* 
	FROM 
		sakila.rental 
	WHERE date_format(rental_date, "%m") =  05);
    
# Create a table `rentals_june` to store the data from rental table with information 
# for the month of June.
# Insert values in the table `rentals_june` using the table rental, 
# filtering values only for the month of June.

 CREATE TABLE
	sakila.rentals_june 
AS (SELECT 
		* 
	FROM 
		sakila.rental 
	WHERE date_format(rental_date, "%m") =  06);

SELECT 
	*
FROM 
	rentals_june
LIMIT 10;

# Check the number of rentals for each customer for May.

SELECT
	customer.customer_id, customer.first_name, customer.last_name, COUNT(rentals_may.rental_id) 
    AS count_rentals_may
FROM
	customer
JOIN
	rentals_may
ON 
	customer.customer_id = rentals_may.customer_id
GROUP BY
	customer.customer_id, customer.first_name, customer.last_name
ORDER BY 
	count_rentals_may DESC;
    
# Check the number of rentals for each customer for June.

SELECT
	customer.customer_id, customer.first_name, customer.last_name, COUNT(rentals_june.rental_id) 
    AS count_rentals_june
FROM
	customer
JOIN
	rentals_june
ON 
	customer.customer_id = rentals_june.customer_id
GROUP BY
	customer.customer_id, customer.first_name, customer.last_name
ORDER BY 
	count_rentals_june DESC;

# Create a Python connection with SQL database and retrieve the 
# results of the last two queries (also mentioned below) as dataframes:




