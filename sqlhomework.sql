SELECT * FROM customers
 WHERE country='UK' ;


SELECT * FROM orders WHERE ship_country='Germany';

--category_ıd si 2 olanların ve unit,-price sı 20 den büyük olanların listesi:
SELECT * FROM products WHERE category_id =2 and unit_price>20;


--italyadan mal aldığım tedarikçilerin listesi
SELECT * FROM suppliers WHERE country='Italy';




