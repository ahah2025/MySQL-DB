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
select  department_id,
		salary
from employees
where department_id = 110;

-- 2) 12008.00, 8300.00 같은 월급을 받는 모든 직원 --> Nancy,Shelley,William
select  employee_id,
		first_name,
        salary
from employees       
where salary in(12008,8300);

-- 3) 합치기
select  employee_id,
		first_name,
        salary
from employees       
where salary in(12008.00,8300.00) = (select  department_id = 110
									 from employees);