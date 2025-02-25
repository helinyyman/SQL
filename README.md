select * from shippers;
-- bir tablodaki kayit sayisini bulmak icin count fonksiyonu kullanilir.
select count(*) from shippers; -- kargo firmalarinin sayisini getirir


select * from customers;
select count(*) from customers; -- 91 adet row vardir
select count(region) from customers; -- 31 adet row vardir
select count(fax) from customers; -- 69 adet row vardir . Geri kalan 22 adet row fax sutununda null deger icerir
select count(*) from customers where fax is null; -- fax sutunu null olan musterileri getirir
select count(*) from customers where fax is not null;


-- Herhangi bir sutununun icerisindeki degerleri toplatmak istedigimizde sum fonksiyonunu kullaniriz
select * from products;
select sum(units_in_stock) from products; -- unit_price sutunundaki degerlerin toplamini getirir

-- 1 numarali kategorideki urunlerin fiyat ortalamasi nedir     
select sum(unit_price)/count(*) ortalama 
from products
where category_id =1
;
-- Daha kisa yolu avg fonksiyonunu kullanmaktir
select avg(unit_price) 
from products
where category_id =1;

-- category'lerine gore gruplayip kac adet urun oldugunu saydirmak istersem 
select category_id,count(*) 
from products
group by category_id
order by count(*) desc;


-- category'lerine gore gruplayip fiyat ortalamasini alalim
select category_id,avg(unit_price) Ortalamafiyat
from products
group by category_id
order by Ortalamafiyat desc;

-- 1996 yilindaki siparislerin kargo firmalarina gore dagilimi nedir . 
-- Hangi kargo firmasi kaç adet urun tasimistir

select ship_via,count(*) Adet ,sum(freight) TasimaUcreti
from orders
where date_part('year',order_date)=1996
group by ship_via;


-- 1996 yilindaki personellerin yaptigi satis adedi nedir ?
select employee_id,count(*) Adet 
from orders 
where date_part('year',order_date)=1996
group by employee_id 
order by Adet desc;

-- 9 numarali personel diger yillarda nasil bir persormans sergilemis .
-- Inceleyelim.

select date_part('year',order_date) Yil,count(*) Adet
from orders
where employee_id=4
group by Yil
order by Yil;

select * from employees;
-- Calisanlarin yaslarini nasil buluruz
select first_name,last_name,age(birth_date) Yas 
from employees
order by yas;

select first_name,last_name,date_part('year',age(birth_date)) Yas 
from employees
order by yas;

-- 1997 yilinda ki satislarin ulkelere gore dagilimi nedir ?
select ship_country ulke,count(*) adet
from Orders 
where date_part('year',order_date)=1997
group by ship_country
order by adet desc;

-- Sum ornekleri 
select * from orders limit 20;
select * from order_details limit 20;

select order_id siparis, sum(unit_price*quantity) Ciro
from Order_details 
--where order_id=10249;
group by order_id
order by siparis;

-- Max ve Min Fonksiyonlari

select max(unit_price)  Fiyat
from products;

select min(unit_price)  Fiyat
from products


select max(order_date) from orders;
select min(order_date) from orders;

select sum(order_date) from Orders; -- Hata verir cunku tarihler toplanamaz

select employee_id ,count(*) Adet
from orders
group by employee_id
order by Adet desc;

-- distinct ile verilerin tekil sayisina ulasiriz
select count(distinct employee_id) from orders; -- 9 adet row vardir

select count(distinct country) from employees -- 2 adet kayit gelecektir. Cunku 2 farkli ulke var
select max(first_name),max(last_name) from employees -- steven cikar ,suyana cikar
select min(first_name),min(last_name) from employees

select * from employees;

-- Sonuc olarak min,max fonksiyonlari butun veri tiplerinde ki kolonlarda kullanilabilir
-- ancak sum ,avg  icin ayni durum soz konusu degildir. Sayisal alanlara uygulanabilir. 
select count(birth_date) from employees; -- 9 adet row vardir
select sum(birth_date) from employees;
select sum(date_part('year',age(birth_date)))/count(birth_date) from employees;  
select avg(date_part('year',age(birth_date))) from employees;


select max(birth_date),min(birth_date) from employees;



select * from orders limit 10;
select product_name,max(unit_price)  Fiyat
from products
group by product_name
order by Fiyat desc;
-- Normalde min ve max metodlari yanliz kullanilir. Aşagidaki sorgu yukaridaki ile ayni sonuc verir
select product_name,unit_price
from products 
order by unit_price desc
