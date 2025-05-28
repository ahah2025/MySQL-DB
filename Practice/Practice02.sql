/* 
문제1.
매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
*/
select count(manager_id) as haveMugCnt
from employees; 		-- 106

/*
문제2. 
직원중에 최고임금(salary)과 최저임금을 "최고임금", "최저임금"으로 출력해 보세요. 
두 임금의 차이는 얼마인가요?  "최고임금 – 최저임금"이란 타이틀로 함께 출력해 보세요.
*/
select  max(salary) as 최고임금,							-- 24000
		min(salary) as 최저임금, 							-- 2100
        MAX(salary) - MIN(salary) as '최고임금-최저임금'		-- 21900
from employees;

/*
문제3.
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예) 2014년 07월 10일
*/
select  '2014-07-10',
		adddate(now(), INTERVAL -9 Year) as 년월일,
        adddate(now(), INTERVAL +2 month) as 년월일
from employees;

select hire_date
from employees
order by hire_date desc; -- 2008-04-21

/*
문제4.
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
select 	max(salary),
		min(salary) 
from employees
group by department_id
order by department_id desc;

/*
문제5.
업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 
정렬순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
*/
select  avg(max_salary/min_salary), -- 평균임금
		max_salary,					-- 최고임금
        min_salary					-- 최저임금
from jobs
group by job_id
order by min_salary desc;
-- datediff(avg(max_salary/min_salary))
-- and avg(max_salary/min_salary) asc;

/*
문제6.
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2005-08-20 Saturday 
*/
select date_format(hire_date,'%Y-%m-%d %W')
from employees
order by hire_date desc;

/*
문제7.
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 
평균임금, 최저임금 그리고 (평균임금 – 최저임금)를 
(평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
select  avg(salary)-min(salary)
from employees
group by department_id
having avg(salary)-min(salary) > 2000
order by avg(salary)-min(salary) desc;

/*
문제8.
업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
차이를 확인할 수 있도록 내림차순으로 정렬하세요 
*/
select  max_salary,
		min_salary
from jobs
order by max_salary-min_salary desc; 

/*
문제9
2005년 이후 입사자중 관리자별(manager_id)로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별(manager_id)로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
평균급여의 내림차순(desc)으로 정렬하고 평균급여는 소수점 첫째짜리에서 반올림 하여 출력합니다.
매니저아이디는 manager_id, 평균급여는 avg, 최대급여는 max, 최소급여는 min 으로 출력합니다.
*/
select  manager_id,
		avg(salary),
        max(salary),
        min(salary)
from employees
having hire_date > 2005;

select  manager_id,
		hire_date,
        salary
from employees
having salary >= 5000
order by salary desc;
/*
문제10
아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다. 
입사일이 02/12/31일 이전이면 '창립맴버', 03년은 '03년입사', 04년은 '04년입사' 
이후입사자는 '상장이후입사' optDate 컬럼의 데이터로 출력하세요.
정렬은 입사일로 오름차순으로 정렬합니다.

아래 2가지 방법으로 했는데 정답인지 모르겠음
*/
select 	first_name,
		hire_date,    
        case when hire_date = '2002/12/31' then '창립멤버'
			 when hire_date = '2003' then '03년입사'
             when hire_date = '2004' then '03년입사'
             else hire_date
       end as '상장이후입사'
from employees;

select  first_name,
		hire_date,
		concat(ceil(datediff(now(),hire_date)/365), '창립멤버')
from employees
where hire_date >= '2002/12/31'
and hire_date >= '2003/01/01'
order by hire_date asc;
/*
문제11 - 필요한 함수(특정날짜의 요일을 숫자로 알려줌)를 검색하고 사용법을 주석으로 남겨두세요
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
예) 2005년 08월 20일(토요일)
*/
select date_format(hire_date,'%Y년 %m월 %d일 %a요일') -- 2008년 04월 21일 Mon
from employees
order by hire_date desc;
