-- 문제1번) dvd 렌탈 업체의  dvd 대여가 있었던 날짜를 확인해주세요.
select * from rental;
select date(rental_date) 
from rental;

-- 문제2번) 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.	
select * from film f ;
select title, length, rental_duration 
from film 
where length >= 120 
    and rental_duration >= 4;

-- 문제3번) 직원의 id 가 2 번인  직원의  id, 이름, 성을 알려주세요	2, Jon, Stephens
select * from staff;
select staff_id, first_name, last_name 
from staff 
where staff_id = 2;

-- 문제4번) 지불 내역 중에서,   지불 내역 번호가 17510 에 해당하는  ,  고객의 지출 내역 (amount ) 는 얼마인가요?	 5.99
select * from payment p ;
select payment_id, amount 
from payment 
where payment_id=17510;

-- 문제5번) 영화 카테고리 중에서 ,Sci-Fi  카테고리의  카테고리 번호는 몇번인가요?	14
select * from category ;
select name, category_id 
from category 
where name='Sci-Fi';

-- 문제6번) film 테이블을 활용하여, rating  등급(?) 에 대해서, 몇개의 등급이 있는지 확인해보세요. 	5
select * from film;
select distinct rating 
from film;
/*
rating
PG-13
NC-17
G
PG
R
*/

-- 문제7번) 대여 기간이 (회수 - 대여일) 10일 이상이였던 rental 테이블에 대한 모든 정보를 알려주세요.
-- 단 , 대여기간은  대여일자부터 대여기간으로 포함하여 계산합니다.	
select * from rental;

select *, 
	(date(return_date) - date(rental_date) + 1) as chk
from rental
where (date(return_date) - date(rental_date) + 1) >= 10
order by chk;


-- 문제8번) 고객의 id 가  50,100,150 ..등 50번의 배수에 해당하는 고객들에 대해서, 
-- 회원 가입 감사 이벤트를 진행하려고합니다.
-- 고객 아이디가 50번 배수인 아이디와, 고객의 이름 (성, 이름)과 이메일에 대해서 
-- 확인해주세요.	
select * from customer;
select customer_id,
		first_name, last_name,
		last_name ||', '|| first_name as fullname, -- || :데이터를 붙임
		email,
		mod(customer_id, 50) as mod_50
from customer
where mod(customer_id, 50) = 0
;
-- 문제9번) 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.	
select * from film;
select title 
from film 
where length(title) >= 8;

-- 문제10번)	city 테이블의 city 갯수는 몇개인가요?	600
select * from city;
-- 풀이 1) 
select * 
from city 
order by city_id desc;

-- 풀이 2)
select max(city_id)
from city;

-- 풀이 3)
select count(distinct city) 
from city; -- 599개

-- 문제11번)	영화배우의 이름 (이름+' '+성) 에 대해서,  대문자로 이름을 보여주세요.  
-- 단 고객의 이름이 동일한 사람이 있다면,  중복 제거하고, 알려주세요.	
select * from actor;
select distinct upper(first_name||' '|| last_name) as fullname 
from actor;
select distinct lower(first_name||' '|| last_name) as fullname 
from actor;

-- 문제12번)	고객 중에서,  active 상태가 0 인 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.	15
select * from customer ;
select count(*) 
from customer 
where active = 0;

--문제13번)	Customer 테이블을 활용하여,  store_id = 1 에 매핑된  고객의 수는 몇명인지 확인해보세요. 326	
select * from customer;
select count(*) 
from customer 
where store_id = 1;

-- 문제14번)	rental 테이블을 활용하여,  고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental 의 갯수가 몇개였는지 확인해보세요. 0	
select * from rental;
select count(*) 
from rental 
where return_date = "2005-06-03";

-- 문제15번)	film 테이블을 활용하여, 2006년에 출시가 되고 rating 이 'G' 등급에 해당하며, 
-- 대여기간이 3일에 해당하는  것에 대한 film 테이블의 모든 컬럼을 알려주세요.	
select  * from film;
select * 
from film 
where release_year = 2006
    and rating = 'G'
    and rental_duration = 3;

-- 문제16번)	langugage 테이블에 있는 id, name 컬럼을 확인해보세요 . 	
select * from language;
select language_id, name 
from language;

-- 문제17번)	film 테이블을 활용하여,  rental_duration 이  7일 이상 대여가 가능한  film 에 대해서  
-- film_id,   title,  description 컬럼을 확인해보세요.	
select * from film;
select film_id, title, description, rental_duration 
from film 
where rental_duration >= 7;

-- 문제18번)	film 테이블을 활용하여,  
-- rental_duration   대여가 가능한 일자가 3일 또는 5일에 해당하는  film_id,  title, desciption 을 확인해주세요.	
select * from film;
select film_id, title, description, rental_duration
from film
where rental_duration in(3, 5);

-- 문제19번)	Actor 테이블을 이용하여,  이름이 Nick 이거나  성이 Hunt 인  배우의  id 와  이름, 성을 확인해주세요.	
select * from actor;
select actor_id, first_name , last_name
from actor
where first_name = 'Nick'
or last_name ='Hunt'
;

-- 문제20번)	Actor 테이블을 이용하여, 
-- Actor 테이블의  first_name 컬럼과 last_name 컬럼을 , firstname, lastname 으로 컬럼명을 바꿔서 보여주세요	
select * from actor;
select first_name as firstname, 
		last_name as lastname 
from actor;
