-- -----------------------------------------
# SubQuery
-- -----------------------------------------
-- SubQuery : 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태

-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?
-- 'Den'의 월급  --> 11000
select  first_name,
		salary
from employees
where first_name = 'Den';

-- 11000보다 많은 사람 리스트
select  first_name,
		salary
from employees
where salary >= 11000  
;

-- 합친다
select  first_name,
		salary
from employees
where salary >= (select salary
				 from employees 
                 where first_name='Den'); -- 가급적 order by 를 하지 않는다.


-- 1)월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?              
select  min(salary) 
from employees;      

-- 2)월급을 가장 적게 받는 사람의 이름, 월급, 사원번호
select  first_name,
		salary,
        employee_id
from employees                                                                                                                                                                                                                                                                                                              
where salary = 2200;

-- 3) 합치기     
select  first_name,
		salary,
        employee_id 
from employees
where salary = (select min(salary)
				from employees);
				
-- 절대로 한방에 작성하지 않는다. 오해 하지 말자 !!!!!                

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
-- 1) 평균월급 --> 6461.831776
select  avg(salary)
from employees;     

-- 2) 6461.831776 보다 월급이 적은 사람을 구한다
select  first_name,
		salary
from employees
where salary <= 6461.831776;

-- 1)과 2) 합치기
select  first_name,
		salary
from employees
where salary <= (select  avg(salary)
				from employees);
                
-- 부서번호가 110인 직원의 월급과 같은 월급을 받는 
-- 모든 직원의 사번, 이름, 월급을 출력하세요
-- 1)부서번호가 110인 직원의 월급  12008.00, 8300.00
select salary
from employees
where department_id = 110;

-- 2-1) 12008.00, 8300.00 같은 월급을 받는 모든 직원 --> Nancy,Shelley,William
-- where 절로 구하기, or 조건절이 여러개
select  employee_id,
		first_name,
        salary
from employees       
where salary = 12008
or salary = 8300;

-- 2-2) 12008.00, 8300.00 같은 월급을 받는 모든 직원 --> Nancy,Shelley,William
-- in () 구하기
select  employee_id,
		first_name,
        salary
from employees       
where salary in(12008.00,8300.00);

-- 3) 합치기 --> 12008.00 / 12008.00 / 8300.00 (3row)
-- 다중행 SubQuery
-- subQuery의 결과가 여러 Row인 경우
select salary
from employees       
where salary in(select salary
				from employees
                where department_id = 110);
                
-- 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요    
-- 1)부서별 최고급여 --> 이름(first_name)출력 안됨
select  department_id, 
		max(salary) 
from employees
group by department_id;

/*
10	4400.00   Jennifer
20	13000.00  Michael
30	11000.00  Den, Gerald, Ellen
*/

-- 2) 각 부서별로 최고급여 받는 사원의 이름 출력
select  first_name,
		department_id,
		salary
from employees
where salary = 4400
or salary = 13000
or salary = 11000;

-- 합치기
select  first_name,
		salary
from employees
where salary = (select max(salary) 
				from employees);