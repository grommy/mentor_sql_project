show tables;

select * from calls;

---1) Показать историю всех звонков на номер пожарной службы

select num_a, calldate
from calls
where num_b=01;

---2) Выбрать максимальную дату в истории звонков на номер пожарной службы

select MAX(calldate)
from calls
where num_b=01;

---3) Выбрать самые «свежие» звонки на номера всех экстренных служб.
----- Результат отсортировать по номеру экстренной службы.

select num_b,num_a,calldate
from calls
having calldate=(select max(calldate) from calls)
order by num_b;

select max(calldate) from calls;

select num_b, num_a, calldate
from calls
where calldate='2011-09-22 00:00:00';




select num_b, num_a, calldate
from calls
where num_b=01 and calldate=(select max(calldate) from calls where num_b=01)
UNION
select num_b, num_a, calldate
from calls
where num_b=02 and calldate=(select max(calldate) from calls where num_b=02)
UNION
select num_b, num_a, calldate
from calls
where num_b=03 and calldate=(select max(calldate) from calls where num_b=03)
UNION
select num_b, num_a, calldate
from calls
where num_b=04 and calldate=(select max(calldate) from calls where num_b=04)
order by num_b;




select num_b as a, num_a, calldate
from calls
where 
	calldate=
		(select from
			(   select num_b, max(calldate) 
				from calls
				group by num_b )
		 where num_b=a)

order by num_b;



select num_b, max(calldate) 
from calls
group by num_b;

---4) Выбрать сведения о звонках  на номер экстренной службы,
----- наиболее «популярной» в последние три дня («текущим» днем считать 22.09.2011)

select *
from calls;

select MAX(tp.pop)
from
(select num_b,  count(*) pop
from calls
where calldate>='2011-09-20'
group by num_b) as tp;

select *
from calls as c1
where exists (
select *
from calls as c2
where c1.num_b=c2.num_b and calldate>='2011-09-20'
group by c2.num_b
having count(*)=(select MAX(tp.pop)
from
(select num_b,  count(*) pop
from calls
where calldate>='2011-09-20'
group by num_b) as tp)
);





