-- PAYMENT 테이블에서 단일 거래의 AMOUNT의 액수가 가장 많은 고객들의 CUSTOMER_ID를 추출하라. 단 CUSTOMER_ID값은 유일해야한다.
SELECT DISTINCT A.CUSTOMER_ID 
FROM PAYMENT A 
WHERE A.AMOUNT =
				(
				SELECT K.AMOUNT
				FROM PAYMENT K
				ORDER BY K.AMOUNT DESC
				LIMIT 1
				);
				

			
-- 고객들에게 단체 이메일을 전송하고자 한다. CUSTOMER 테이블에서 고객의 EMAIL주소를 추출하고
-- 이메일 형식에 맞지 않는 이메일 주소는 제외시켜라
-- 이메일 GUDTLRDMS @가 존재해야 하고 @로 시작하지 말아야 하고 @로 끝나지 말아야 한다.
select * 
from customer;

select EMAIL 
from CUSTOMER 
where EMAIL not like '@%'
and EMAIL not like '%@'
and EMAIL like '%@%';