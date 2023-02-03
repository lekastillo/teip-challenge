select p.id, p.name, Sum(od.quantity) as sells, Sum(od.quantity*p.price) as amount 
from products as p
join order_details as od on p.id = od.product_id
join orders as o on o.id = od.order_id 
where o.status = 'confirmed'
group by p.id, p.name
order by Sum(od.quantity) desc