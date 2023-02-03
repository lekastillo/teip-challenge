select p.id, p.name, count(pl.product_id) as likes 
from products as p
join product_likes as pl on p.id = pl.product_id
group by p.id, p.name
order by count(pl.product_id) desc