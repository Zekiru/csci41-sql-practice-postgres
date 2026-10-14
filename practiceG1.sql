-- 1
select title, cost, retail, (retail - cost) as profit
from book
where category = 'Computer'
order by profit desc;

-- 2
select orderno, customerno, orderdate, shipdate
from orders
where shipdate is null;

-- 3
select b.title, b.category, p.name as publisher_name
from book b
join publisher p on b.pubid = p.pubid
order by title asc;

-- 4
select p.pubid, p.name, b.title
from publisher p
left join book b on p.pubid = b.pubid
order by p.pubid asc;

-- 5
select o.orderno, c.firstname, c.lastname, o.orderdate
from orders o
join customer c on o.customerno = c.customerno
order by o.orderno;

-- 6
select b.title, a.fname, a.lname
from bookauthor ba
inner join book b on ba.isbn = b.isbn
inner join author a on ba.authorid = a.authorid
order by b.title, a.lname;

-- 7
select c.customerno,
c.firstname || ' ' || c.lastname as customer_name,
r.firstname || ' ' || r.lastname as referred_by_name
from customer r
join customer c on  r.customerno = c.referredby;

-- 8
select o.orderno, oi.itemno, b.title, oi.quantity, b.retail
from orders o
join orderitem oi on o.orderno = oi.orderno
join book b on oi.isbn = b.isbn
where o.orderno = 1007
order by oi.itemno;

-- 9
select c.customerno, c.firstname, c.lastname, count(o.orderno) as order_count
from customer c
join orders o on c.customerno = o.customerno
group by c.customerno, c.firstname, c.lastname
having count(o.orderno) >= 2
order by order_count desc, c.customerno asc;

-- 10
select c.firstname || ' ' || c.lastname as customer_name,
o.orderdate,
b.title,
oi.quantity,
b.retail,
(oi.quantity * b.retail) as item_total
from orders o
join customer c on o.customerno = c.customerno
join orderitem oi on o.orderno = oi.orderno
join book b on oi.isbn = b.isbn
where o.orderno = 1012
order by (oi.quantity * b.retail) desc;
