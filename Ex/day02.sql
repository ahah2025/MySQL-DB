/*******************************************
select 문(조회)
*******************************************/
-- -----------------------------------------
-- where 절
-- -----------------------------------------
-- 부서아이디가 10인 사원의 이름을 구하시오
select first_name,
	   department_id
from employees
where department_id = 30;	 -- >, <, >=, <= 연산자

select first_name
from employees
where department_id = 10;

-- 월급이 15000 이상인 사원들의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where salary >= 15000;
 
-- 07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요 
select first_name,
	   hire_date
from employees 
where hire_date >= '07.01.01';

-- 특정기준일을 0으로 해서 숫자로 관리한다
-- 1700-01-01

-- 2025-05-23 00:00:00

-- 이름이 Lex인 직원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where first_name = 'Lex';

-- 비교
select first_name,
	   salary
from employees
where first_name = 'lEx'; -- 대소문자를 구별하지 않는다

-- 문자열 대소문자를 구별하지 않는다. 구별하려면 binary 사용
select first_name,
	   salary
from employees
where binary first_name = 'lEx'; -- 대소문자를 구별한다

-- 조건이 2개이상 일때 한꺼번에 조회하기
-- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
-- salary >= 14000 월급이 14000 이상
-- salary <= 17000 월급이 17000 이하 
-- 두 조건 모두 만족하는 논리연산자  (&&--> and), (|| --> or)
select first_name
	   ,salary
from employees
where salary >= 14000 
and salary <=17000;  

-- 월급이 14000 이하이거나 17000 이상인 사원의 이름과 월급을 출력하세요
select first_name
	   ,salary
from employees
where salary <=14000
or salary >=17000;

-- 입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name
       ,hire_date
from employees
where hire_date >= '04/01/01' 
and hire_date <= '05/12/31';

-- BETWEEN 연산자로 특정구간 값 출력하기
-- 월급이 14000 이상 17000이하인 사원의 이름과 월급을 구하시오
select first_name,
	   salary
from employees
where salary >= 14000
and salary <= 17000;

select first_name,
	   salary
from employees
where salary between 14000 and 17000;

-- IN 연산자로 여러 조건을 검사하기
-- Neena, Lex, John 의 이름, 성, 월급의 구하시오
select first_name,
	   last_name,
       salary
from employees
where first_name = 'neena'
or first_name = 'lex'
or first_name = 'john';

select first_name,
	   last_name,
       salary
from employees
where first_name in('Neena' , 'Lex' , 'John' );

-- 월급이 2100, 3100, 4100, 5100 인 사원의 이름과 월급을 구하시오
select first_name,
       salary
from employees
where salary in('2100' ,'3100','4100', '5100'); -- 6 row

-- Like 연산자로 비슷한것들 모두 찾기
select first_name,
	   last_name,
       salary
from employees
where first_name like 'L%';
-- where first_name like 'L___';

-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees
where first_name like '%am%';

-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name,
	   salary
from employees 
where first_name like '_a_';		 -- Pat 출력

-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name,
	   salary
from employees
where first_name like '___a_';		 -- 5ea

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '____'
and first_name like '_a__';  -- Jack