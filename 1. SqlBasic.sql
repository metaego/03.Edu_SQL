-- sqlplus창 보기 화면 여백 조절 편집 명령어
-- set linesize 200
-- set pagesize 200b

/*
테이블 구조 검색 명령어
desc 테이블명;

NUMBER(4) : 정수 4자리
VARCHAR2(10) : 철자 10개까지 허용하는 문자열
NUMBER(7,2) : 실수, 전체 자릿수 7자리 단 소수점 이하 2자리
*/


/*
데이터 조회 명령어

1. select문
select 검색하고자하는컬럼명 from table명;

- 실행순서 : from -> select


2. 정렬(order by)
select 검색하고자하는컬럼명 from table명 order by 정렬기준컬럼명 asc(desc);

- 실행순서: from절 -> select절 -> order by절



3. 조건절
select 검색하고자하는컬럼명 from table명 where '조건식';

- 실행순서: from절 -> where절 -> select절



4. 조건절 & 정렬절
select ___ from ___ where '조건식' order by ___ asc(desc);

- 실행순서: from절 -> where -> select -> order by

4.1. is null, is not null
select __ from __ where __ is (not) null;

4.2. column = 'value'
select __ from __ where column = 'value';

4.3. column >= value
select __ from __ where column >= value;

4.4. 조건식이 하나 이상: and, or
select __ from __ where column1=value1 and column2=value2;
select __ from __ where column1=value1 or column2=value2;

select __ from __ where column1 <= value1 or column2 >= value2;

select __ from __ where column1=value1 or column2=value2 or column3=value3;
select __ from __ where column1 in (value1, value2, value3);

select __ from __ where not column1 in (value1, value2, value3);
select __ from __ where column1 not in (value1, value2, value3);

4.5. 조건식 부정: not, !=, <>
select __ from __ where column1 != value1;
select __ from __ where not column1 = value1;
select __ from __ where column1 <> value1;



5. 별칭 Alias
select __ as 별칭명 from __;



6. 중복제거 distinct
select distinct__ from __;



7. null값 치환: nvl(null보유컬럼, 변경할 값)
select nvl(comm, 0), sal*12+nvl(comm, 0) as 연봉 from emp;



8. 기간: between A and BACKUP 
select __from __where 비교컬럼명 between '81/01/01' and '81/12/31';



9. 문자열 찾기: like _, %
select __from __where __ like '_M%'

*/

/*
- 잉여 테이블
임시 테이블로 syntax 오류 방지용으로 주로 사용

*/