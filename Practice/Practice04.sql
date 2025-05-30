/*  서 브 커 리  SUBQUERY
문제1. 
평균 월급보다 적은 월급을 받는 직원은 몇명인지 구하시요.
*/
select avg(salary) as 평균월급 -- 6461.831776
from employees;

select count(salary)
from employees
where salary < 6461.831776;

/*
문제2.
평균월급 이상, 최대월급 이하의 월급을 받는 사원의  
직원번호(employee_id), 이름(first_name), 월급(salary), 평균월급, 최대월급을 월급의 오름차
순으로 정렬하여 출력하세요  
(51건) 
*/       
-- 평균월급: 6461.831776
-- 최대월급: 24000.00
select  employee_id,
        salary
from employees
where salary in(6461.831776,24000.00)
order by salary asc;

select *
from employees
where salary = (select max(salary)
				from employees)
                order by salary asc;

/*
문제3. 
직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 
있는 곳의 주소를 알아보려고 한다. 
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 
도시명(city), 주(state_province), 나라아이디(country_id) 를 출력하세요
*/
select count(*)
from
(
	( -- 왼쪽 join
	select  e.first_name,
			e.last_name,
			e.department_id,
			l.location_id,
			l.street_address,
			l.postal_code,
			l.city,
			l.state_province,
			l.country_id
	from employees e, locations l 
	left outer join departments d
				 on e.department_id = d.department_id
	)             
	union
	( -- 오른쪽 join
	select  e.first_name,
			e.last_name,
			e.department_id,
			l.location_id,
			l.street_address,
			l.postal_code,
			l.city,
			l.state_province,
			l.country_id 
	from employees e, locations l 
	right outer join departments d
				 on e.department_id = d.department_id
	)
) t 
;
/*
문제4. 
job_id 가 'ST_MAN' 인 직원의 월급보다 작은 직원의 사번,이름,월급을 월급의 내림차순으로 
출력하세요  -ANY연산자 사용 (or)
(74건)
*/
select  min_salary,
		max_salary
from jobs
where min_salary >= any (5500,8500);

--  where 절
select *
from jobs
where min_salary <= 5500
or max_salary <= 8500;

-- 합치기
-- or ---> any
select 	e.employee_id,
		e.first_name,
		e.salary,
        j.job_id
from employees e ,jobs j
where salary >=any (select salary 
					from employees, jobs 
					where salary = 5500 
                    order by salary desc);

/*
문제5.  
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name)과 월급
(salary) 부서번호(department_id)를 조회하세요  
단 조회결과는 월급의 내림차순으로 정렬되어 나타나야 합니다.  
조건절비교, 테이블조인 2가지 방법으로 작성하세요 
(11건)
*/





/*
문제6. 
각 업무(job) 별로 월급(salary)의 총합을 구하고자 합니다.  
월급 총합이 가장 높은 업무부터 업무명(job_title)과 월급 총합을 조회하시오  
(19건) 
*/








/*
문제7. 
자신의 부서 평균 월급보다 월급(salary)이 많은 직원의 직원번호(employee_id), 이름
(first_name)과 월급(salary)을 조회하세요  
(38건)
*/





/*
문제8. 
직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 월급, 입사일을 입사일 순서로 출력
하세요 
*/