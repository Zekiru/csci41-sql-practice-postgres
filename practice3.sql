-- 1
select c.customerno as "Customer Number", 
c.firstname || ' ' || c.lastname as "Customer Name",
o.orderno as "Order Number",
o.orderdate as "Date of Order",
o.shipdate as "Date of Shipping"
from orders o, customer c
where o.customerno = c.customerno
and c.state = 'FL';

-- 2
select p.contact as "Contact Name",
p.name as "Publisher Name",
p.phone as "Phone"
from book b, publisher p
where b.pubID = p.pubID
and b.category = 'Children';

-- 3
select b.title as "Book Title",
a.fname || ' ' || a.lname as "Author's Name"
from book b, author a, bookauthor ba
where b.ISBN = ba.ISBN
and ba.authorid = a.authorID
and b.category = 'Family Life';

-- 4
select c.customerno as "Customer Number",
count(o.orderno)
from customer c, orders o
where o.customerno = c.customerno
and c.lastname='LUCAS'
and c.firstname='JAKE'
group by c.customerno;

-- 5
select c1.firstname || ' ' || c1.lastname as "Customer Name",
c2.firstname || ' ' || c2.lastname as "Referred By"
from customer c1
left join customer c2 on c1.referredby = c2.customerno
where c1.referredby = c2.customerno;

-- 6
select distinct c.customerno as "Customer Number",
c.firstname || ' ' || c.lastname as "Customer Name",
o.orderno as "Order Number",
o.orderdate as "Order Date"
from customer c
left join orders o on o.customerno=c.customerno
order by c.customerno asc;

-- 7
select book.title, book.category
from customer, orders, book, orderitem
where customer.lastname='SMITH'
and customer.firstname='LEILA'
and customer.customerno=orders.customerno
and orders.orderno=orderitem.orderno
and orderitem.ISBN=book.ISBN;

select b.title, b.category
from customer c, orders o, book b, orderitem oi
where c.lastname='SMITH'
and c.firstname='LEILA'
and c.customerno=o.customerno
and o.orderno=oi.orderno
and oi.ISBN=b.ISBN;
