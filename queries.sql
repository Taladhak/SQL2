-- write your queries here
select * 
from owners o 
full join vehicles v 
on o.id = v.owner_id;

-- Count the number of cars for each owner
select o.first_name, o.last_name, count(v.id)
from owners o 
join vehicles v on o.id = v.owner_id
group by o.id, o.first_name, o.last_name
order by o.first_name;

-- Count the number of cars for each owner and display the owners who have more than 1 car and average price is greater than 10000
select 
    o.first_name, 
    o.last_name, 
    round(avg(v.price))::integer as average_price,
    count(v.id) as count
from owners o 
join vehicles v on o.id = v.owner_id
group by o.id, o.first_name, o.last_name
having count(v.id) > 1 and avg(v.price) > 10000
order by o.first_name desc;