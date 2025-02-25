select * from Products limit 2;
select * from categories limit 2; 
select * from suppliers limit 10;

-- inner join iki kumenin kesisimini alir
select p.product_name,c.category_name 
from products p
join categories c on p.category_id=c.category_id;