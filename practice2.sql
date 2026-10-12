-- 2
select * 
from book 
where title like '%u%';

-- 3
select author_name 
from book 
where price < 600;

-- 4
select title, price from book
where price > 50 and price <= 500;

-- 5
insert into publisher(name, country)
values('MacLehose Press', 'United Kingdom');

--6
insert into book(
    title, 
    author_name, 
    author_address, 
    price, 
    advance, 
    royalty, 
    pubdate, 
    pub_id
)
values(
    'The Girl with the Dragon Tattoo', 
    'Steig Larsson', 
    'Sweden', 
    545.00, 
    150000, 
    0.15, 
    '2008-10-01', 
    3
);

-- 7
select book_id, title
from book
order by price asc
limit 10;

-- 8
select title
from book
where title like '%Lord of the Rings%'
or title like '%A Song of Ice and Fire%';

-- 9
select b.title as "Title of Book",
b.author_name as "Name of Author",
p.name as "Name of Publisher"
from book b, publisher p
where b.pub_id = p.pub_id
order by p.name, b.author_name;

-- 10
select distinct author_name
from book
where lower(author_name) like '%t%';
