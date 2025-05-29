-- -----------------------------------------
# SubQuery
-- -----------------------------------------
-- SubQuery : 하나의 SQL 질의문 속에 다른 SQL 질의문이 포함되어 있는 형태

-- 'Den' 보다 월급을 많은 사람의 이름과 월급은?
-- 1)'Den'의 월급 11000
select salary
from employees
where first_name = 'Den';

-- 2) 11000보다 많은 사람 리스트
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

-- 월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
-- 가장적은 월급 min(), 그룹함수라서 이름..하고 같이 사용할수 없다
-- 1)가장 적은 월급 --> 2100          
select  min(salary) 
from employees;      

-- 2)월급을 2100인 사람의 이름, 월급, 사원번호
select  first_name,
		salary,
        employee_id
from employees                                                                                                                                                                                                                                                                                                              
where salary = 2100;

-- 3) 합치기     
select  first_name,
		salary,
        employee_id 
from employees
where salary = (select min(salary)
				from employees);
				
-- !!! 절대로 한방에 작성하지 않는다. 오해 !!!!!  하지 말자                

-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
-- 1) 평균월급 --> 6461.831776
select  avg(salary)
from employees;     

-- 2) 6461.831776 보다 월급이 적은 사람을 구한다
select *
from employees
where salary <= 6461.831776;

-- 1)과 2) 합치기
select  first_name,
		salary
from employees
where salary <= (select  avg(salary)
				from employees)
                order by salary desc;
                
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
-- 2-1) where 절로 표현
/*
select  first_name,
		department_id,
		salary
from employees
where salary = 4400
or salary = 13000
or salary = 11000;
*/

select  first_name,
		department_id,
		salary
from employees
where (salary = 4400 and department_id = 10)
or (salary = 13000 and department_id = 20)
or (salary = 11000 and department_id = 30)
;

-- 2-2 in()    --> 비교값이 2개 이상

select  first_name,
		department_id,
		salary
from employees
where (department_id, salary) in ((10, 4400), (20,13000), (30,11000)); 

-- 3) 합치기  2-2사용
select  first_name,
		department_id,
		salary
from employees						-- 1)식
where (department_id, salary) in (select department_id, 
										 max(salary) 
								  from employees
                                  group by department_id);
                                  
-- 부서번호가 110인 직원의 월급 중
-- 가장 작은 월급(8300.00) 보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)              

-- 1) 부서번호가 110인 직원의 월급 (8300, 12008)
select  first_name,
		salary
from employees
where department_id =110;


-- 2) 8300보다 많은 직원(8300보다 많은 또는 12008 보다 많은 직원)
-- 2-1) where절
select *
from employees
where salary >= 8300
or salary >= 12008;
         
-- 2-2) any()    where절이 or일때         
select *
from employees
where salary >= any (8300,12008);

-- 3) 합치기
-- or ---> any
select 	first_name,
		salary
from employees
where salary >=any (select salary 
					from employees
					where department_id = 110 );

-- 부서번호가 110인 직원의 월급 중
-- 가장 작은 월급(8300.00) 보다 월급이 많은 모든 직원의
-- 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)          

-- 1) 부서번호 110인 직원의 월급 구하기
select  first_name,
		salary
from employees
where department_id=110;

-- 2) 부서번호가 110인 직원의 월급 중 가장 작은 월급보다 월급이 높은 직원 구하기
-- 2-1) where 절로 표현 
select  first_name,
		salary
from employees
where salary > 8300
and salary > 12008;
                 
-- 2-2) all ()로 표현   -- 의미만
select 	first_name,
		salary
from employees
where salary >all (8300, 12008);


-- 합치기 2-2 사용
select  first_name,
		salary
from employees
where salary >all (select salary
				   from employees
				   where department_id=110);
      
-- ------------------------------------------------
# SubQuery   where절 vs 테이블
-- ------------------------------------------------      
-- #where절로 해결
-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
-- 1) 각 부서별 최고 월급   (리스트)
select 	department_id,
		max(salary) 
from employees
group by department_id
order by department_id asc;   --  확인용      
      
-- 2-1) where절  
select *
from employees
where department_id =10 and salary = 4400
or department_id =20 and salary = 13000
or department_id =30 and salary = 11000;      
      
-- 2-2)   in (),  >any (),  >all () 
select *
from employees
where (department_id, salary) in ( (10,4400) , (20,13000) , (30,11000));

-- 3) 2-2)로 합친다
-- 부서번호, 직원번호, 이름, 월급
select 	department_id,
		employee_id,
        first_name,
        salary
from employees      
where (department_id, salary) in (select department_id,
										 max(salary) 
								  from employees
								  group by department_id);

/*
select *
from 테이블명
where 컬럼명 in (서브커리 결과)
*/      
      
-- ----------------------------------------------------      
-- #from절의 테이블로 해결
/*
-- 테이블2를 조인한다
select *
from 테이블명, 테이블2(서브퀄결과)
where 컬럼명 = 컬럼명
*/

-- 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요
-- 1) 각 부서별 최고월급
select  department_id,
		max(salary)
from employees
group by department_id;

select *
from locations;
/*결과 일부
(10, 4400)
(20, 13000)
(30, 11000)
*/      

-- 2) 전체구조
select employee_id,
	   department_id,
	   first_name,
	   salary
from employees e,  가상의테이블 s
where e.department_id = s.department_id
and e.salary = s.salary;

select  e.department_id,
		e.employee_id,
        e.first_name,
		e.salary,
		s.maxSalary
from employees e, (select  department_id,
						   max(salary) maxSalary
				   from employees
				   group by department_id) s 
where e.department_id = s.department_id
and e.salary = s.maxSalary; 

