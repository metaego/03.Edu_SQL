-- 문제1번) film 테이블을 활용하여,  film 테이블의  100개의 row 만 확인해보세요. 	
select * from film limit 100;

-- 문제2번) actor 의 성(last_name) 이  Jo 로 시작하는 사람의 id 값이 가장 낮은 사람 한사람에 대하여, 
-- 사람의  id 값과  이름, 성 을 알려주세요.	 
--actor_id	first_name	last_name
--8	Matthew	Johansson
select * from actor;
select actor_id
	, first_name
	, last_name 
from actor
where last_name like 'Jo%'
order by actor_id 
limit 1;

-- 문제3번)film 테이블을 이용하여, film 테이블의 아이디값이 1~10 사이에 있는 모든 컬럼을 확인해주세요.	
select * 
from film;
select *
from film 
where film_id between 1 and 10;

-- 문제4번) country 테이블을 이용하여, country 이름이 A 로 시작하는 country 를 확인해주세요.	
--country
--Afghanistan
--Algeria
--American Samoa
--Angola
--Anguilla
--Argentina
--Armenia
--Australia
--Austria
--Azerbaijan
select * from country;
select country from country 
where country like 'A%';

--문제5번) country 테이블을 이용하여, country 이름이 s 로 끝나는 country 를 확인해주세요.	
select * from country;
select country
from country c 
where country like '%s';
--country
--Belarus
--Faroe Islands
--Netherlands
--Philippines
--Saint Vincent and the Grenadines
--United Arab Emirates
--United States


--문제6번) address 테이블을 이용하여, 우편번호(postal_code) 값이 77로 시작하는  주소에 대하여, 
-- address_id, address, district ,postal_code  컬럼을 확인해주세요.	
select * from address;
select address_id
	, district
	, postal_code 
from address a 
where postal_code like '77%';


-- 문제7번) address 테이블을 이용하여, 우편번호(postal_code) 값이  두번째글자가 1인 우편번호의  
-- address_id, address, district ,postal_code  컬럼을 확인해주세요.	
select * from address;
select address_id
	, address
	, district
	, postal_code
from address a 
where POSTAL_CODE like '_1%';


-- 문제8번) payment 테이블을 이용하여,  고객번호가 341에 해당 하는 사람이 결제를 2007년 2월 15~16일 사이에 한 
-- 모든 결제내역을 확인해주세요.
select * from payment p ;
select * 
from payment p 
where customer_id = 341
and cast (payment_date as DATE) between '2007-02-15' and '2007-02-16';
--payment_id	customer_id	staff_id	rental_id	amount	payment_date
--17,503	341	2	1,520	7.99	2007-02-15 22:25:46.996
--17,504	341	1	1,778	1.99	2007-02-16 17:23:14.996
--17,505	341	1	1,849	7.99	2007-02-16 22:41:45.996


-- 문제9번) payment 테이블을 이용하여, 고객번호가 355에 해당 하는 사람의 결제 금액이 1~3원 사이에 해당하는 모든 결제 내역을 확인해주세요.	
select * from PAYMENT;
select *
from payment p 
where customer_id =355
and amount between 1 and 3;


-- 문제10번) customer 테이블을 이용하여, 고객의 이름이 Maria, Lisa, Mike 에 해당하는 사람의 id, 이름, 성을 확인해주세요.	
select * from customer c ;
select CUSTOMER_ID
	, FIRST_NAME
	, LAST_NAME
from customer c 
where first_name in ('Maria', 'Lisa', 'Mike');
--customer_id	first_name	last_name
--7	Maria	Miller
--11	Lisa	Anderson
--403	Mike	Way


-- 문제11번) film 테이블을 이용하여,  film의 길이가  100~120 에 해당하거나 또는 
-- rental 대여기간이 3~5일에 해당하는 film 의 모든 정보를 확인해주세요.	
select * from film;
select * 
from film f 
where length between 100 and 120
or rental_duration between 3 and 5;

-- 문제12번) address 테이블을 이용하여, postal_code 값이  공백('') 이거나 
-- 35200, 17886 에 해당하는 address 에 모든 정보를 확인해주세요.	
select  * from address;
select * 
from address a 
where postal_code is null 
or POSTAL_CODE in (35200, 17886)
;


-- 문제13번) address 테이블을 이용하여,  address 의 상세주소(=address2) 값이  존재하지 않는 모든 데이터를 확인하여 주세요. 	
select * from ADDRESS;
select *
from address a 
where ADDRESS iS null;


-- 문제14번) staff 테이블을 이용하여, staff 의  picture  사진의 값이 있는  직원의  id, 이름,성을 확인해주세요.  
-- 단 이름과 성을  하나의 컬럼으로 이름, 성의형태로  새로운 컬럼 name 컬럼으로 도출해주세요.	
select * from STAFF;

select staff_id 
, (first_name ||' '|| last_name) as NAME  
from STAFF
where STAFF_ID = 
(select STAFF_ID
from staff s 
where PICTURE is not null)
;


-- 문제15번) rental 테이블을 이용하여,  대여는했으나 아직 반납 기록이 없는 대여건의 모든 정보를 확인해주세요.	
select * from RENTAL;
select * 
from rental r 
where rental_date is not null 
and RETURN_DATE is null;

-- 문제16번) address 테이블을 이용하여, postal_code 값이  빈 값(NULL) 이거나 35200, 17886 에 해당하는 
-- address 에 모든 정보를 확인해주세요.	
select * from ADDRESS;
select * 
from address a 
where POSTAL_CODE iS null
or POSTAL_CODE = ''
or POSTAL_CODE in ('35200', '17886');


-- 문제17번) 고객의 성에 John 이라는 단어가 들어가는, 고객의 이름과 성을 모두 찾아주세요.	
select * from CUSTOMER;
select first_name 
	, last_name
from customer c 
where last_name like 'John%';


-- 문제18번) 주소 테이블에서, address2 값이 null 값인 row 전체를 확인해볼까요?
select * from address a;
select * 
from address a 
where address2 is null;
--address_id	address	address2	district	city_id	postal_code	phone	last_update
--1	47 MySakila Drive	[NULL]	Alberta	300			2006-02-15 09:45:30.000
--2	28 MySQL Boulevard	[NULL]	QLD	576			2006-02-15 09:45:30.000
--3	23 Workhaven Lane	[NULL]	Alberta	300		14033335568	2006-02-15 09:45:30.000
--4	1411 Lillydale Drive	[NULL]	QLD	576		6172235589	2006-02-15 09:45:30.000