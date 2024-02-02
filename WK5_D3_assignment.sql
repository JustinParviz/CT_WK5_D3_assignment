

-- WK5 D3 Homework Assignment


--1. List all customers who live in Texas (use
--JOINs)


select first_name, last_name
from customer 
inner join address
on customer.address_id = address.address_id
where district = 'Texas'


--2. Get all payments above $6.99 with the Customer's Full
--Name


select first_name, last_name, amount
from customer 
inner join payment 
on customer.customer_id = payment.customer_id 
where amount > 6.99


--3. Show all customers names who have made payments over $175(use
--subqueries)


select *
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc 
)


--4. List all customers that live in Nepal (use the city
--table)


select *
from customer
where address_id in (
	select address_id
	from address
	where city_id in (
		select city_id
		from city
		where country_id in (
			select country_id
			from country
			where country = 'Nepal'
		)
	)
);


--5. Which staff member had the most
--transactions?


select first_name, last_name, count(payment.staff_id)
from staff 
inner join payment
on staff.staff_id = payment.staff_id 
group by first_name, last_name
order by count(payment.staff_id) desc


--6. How many movies of each rating are
--there?


select rating, count(film_id)
from film 
group by rating  


--7. Show all customers who have made a single payment
--above $6.99 (Use Subqueries)


select *
from customer 
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
	group by customer_id
	having count(*) = 1
	
);


--8. How many free rentals did our stories give away?


select count(rental_id)
from payment 
where amount = 0


