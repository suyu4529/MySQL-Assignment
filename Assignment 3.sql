use classicmodels;

select*from customers;
select*from customers where country = "USA";

-- count the customers
select count(country)from customers where country = "USA";

select customername,city,country,creditlimit
from customers where country = "USA";

select customername,city,country,creditlimit,
creditlimit * 18/100 as GST_value,
creditlimit+creditlimit * 18/100 as update_amount
from customers where country = "USA";
