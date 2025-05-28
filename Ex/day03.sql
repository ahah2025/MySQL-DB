use hr_db;

-- 복습(select문은 select, from, where, order by 4개의 절로 구성된다)
-- 월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
-- select 문의 기본구조(4개의 절)
-- *작동순서를 잘 알아야 한다
-- 정상작동
select 	first_name fname,
		salary s
from employees
where salary >= 10000    
order by salary desc;

-- while 정 X, order by절 O --> 작동순서를 알아야 한다.
select first_name fname,
	   salary s
from employees       
where S >= 10000
order by s desc;

/**********************************************
* 단일행 함수
**********************************************/
-- * 단일행 함수 > 숫자함수

-- * round() : 반올림
select round(123.123,2), 		-- 123.123 소수점 2자리까지 표현
	   round(123.126,2),   		-- 소수점 3자리까지 반올림
       round(234.567,0),   		-- 235  '4'라는 숫자가 반올림됨
       round(123.456,0),    	-- 123  
       round(123.124, -1),    	-- 120
       round(125.126, -1),    	-- 130  5가 반올림 되서 130이라는 결과값이 나옴
	   round(125.126, -2)		-- 100  	
from dual;

/**
select round(salary,2)  		-- 급여에서 소수점 2자리까지 표현
from employees;
**/

-- * Ceil() : 올림    0번째자리까지 표현(소수점1자리에서 버림)
select ceil(123.456),       -- 124
	   ceil(123.789), 	    -- 124
       ceil(123.7892313), 	-- 124
       ceil(987.1234) 		-- 988
from dual;

-- * floor(숫자) : 내림 0번째 자리까지 표현(소수점1자리버림)
select floor(123.456),	 	-- 123 
	   floor(123.789), 		-- 123
       floor(123.7892313),  -- 123
       floor(987.1234) 		-- 987	
from dual;
 
-- * truncate() : 자리수 버림 
select truncate(1234.34567,2),    -- 1234.34
       truncate(1234.34567,3), 	  -- 1234.345
       truncate(1234.34567,0),	  -- 1234
       truncate(1235.34567, -2)   -- 1200   	23가 -2 로 되어서 자리수 버려짐
from dual; 

-- POWER(숫자, n),  POW(숫자, n): 숫자의 n승 
select power(12,3), 		-- 1728
	   pow(12,2)			-- 144
from dual;

-- * SQRT(숫자): 숫자의 제곱근
select sqrt(144) 
from dual;

-- * SIGN(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1  
select sign(123),    -- 1(양수)
	   sign(0),		 -- 0
	   sign(-2)		 -- '-1'(음수)
from dual;

-- * ABS(숫자): 절대값
select abs(123),			 -- 123
	   abs(0) as '절대값',     -- 0
       abs(-123)		     -- 123
from dual;

-- * GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값  
select greatest(2, 0, -2),   	   				-- 2
	   greatest(4, 3.2, 5.25) as '5.25',        -- 5.25
       greatest('B','A','C','c'),         	    -- C
       greatest('ㅣ','ㅏ','ㅑ','ㅙ')				-- ㅣ
from dual;

-- * LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값
select  least(2,0,-2),		  		-- -2
		least(4,3.2,5.25),    		-- 3.2
        least('B','A','C','c')      -- A
from dual;

-- ----------------------------------------------------------------
-- *단일행함수 > 문자함수
-- *CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결 
select concat('안녕','하세요')
from dual;

select concat('안녕','-','하세요')
from dual;

select concat(first_name,last_name)
from employees;

-- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., 
-- str(n:숫자)을 연결할때 사이에 s 로 연결
select concat_ws('-','abc','123','가나다') -- abc-123-가나다
from dual;

select first_name,last_name,
	   concat(first_name,last_name),
       concat(first_name,'-',last_name,'-',employee_id),
	   concat_ws('-',first_name,last_name,employee_id)
from employees;

-- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
select first_name,
	   lcase(first_name),
       lower(first_name),
       lower('ABCabc!#$%'),
       lower('가나다')
from employees;

-- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
select first_name,
	   ucase(first_name),
       upper(first_name),
       upper('ABCabc!#$%'),
	   upper('가나다')
from employees;

-- 문자갯수
-- LENGTH(str): str의 길이를 바이트로 반환
-- CHAR_LENGTH(str) 또는 CHARACTER_LENGTH(): str의 문자열 길이를 반환
select first_name,
	   length(first_name), 				-- 바이트수(조심)
       char_length(first_name),			-- 글자수
       character_length(first_name)		-- 글자수
from employees;

select length('가'),					-- 바이트수( 3 )
       char_length('a'),			-- 글자수
       character_length('a')		-- 글자수
from dual;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len): 
-- str의 pos 위치에서 시작하여 len 길이의 문자열 반
select first_name,
	   substring(first_name,1,3),  	-- 1번째 글자,  +3번째 글자 ==> 1번째 글자부터 3번쩨 글자까지 글자갯수
       substring(first_name,2,3),  	-- 2번째 글자,  +3번째 글자 ==> 2번째 글자부터 3번쩨 글자까지 글자갯수
	   substring(first_name,-3,2)   -- 뒤에서 3번째 글자,  +2번째 글자 ==> 뒤에서 3번째 글자부터 오른쪽으로 2개 글자까지 글자갯수
from employees;

select substring('901112-1234567',8,1),   -- 8번째 글자, 성별
	   substring('901112-1234567',-7,1),  -- 성별
       substring('94166056',1,2)   		  -- 입학년도
from dual;

-- LPAD(str, len, padstr):, RPAD(str, len, padstr)
select lpad(first_name,10,'*'),
	   rpad(first_name,10,'*')
from employees;

-- TRIM(str): str의 양쪽에 있는 공백 문자를 제거
-- LTRIM(str): str의 왼쪽에 있는 공백 문자를 제거
-- RTRIM(str): str의 오른쪽에 있는 공백 문자를 제거
-- |________안녕하세요________|
 select concat('|', '        안녕하세요        ', '|'),
		concat('|', trim('        안녕하세요        '), '|'),
        concat('|', ltrim('        안녕하세요        '), '|'),
        concat('|', rtrim('        안녕하세요        '), '|'),
        concat('|', '        안녕하세요        ', '|'),
        trim(concat('|', '        안녕하세요        ', '|'))
 from dual;

-- * REPLACE(str, from_str, to_str): str에서 from_str을 to_str로 변경
select first_name,
	   substr(first_name,2,3),
       replace(first_name,substr(trim(first_name),2,3),'***')  -- 이벤트 당첨자
from employees;

-- 날짜/시간 함수
-- 날짜
select current_date() from dual;
select curdate() from dual;

-- 시간
select current_time() from dual;
select curtime() from dual;

-- 날짜 + 시간
select current_timestamp() from dual;       
select now() from dual;

-- ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기
-- SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기
select '2021-06-20 00:00:00',
	   adddate('2021-06-20 00:00:00',INTERVAL 1 YEAR), 		-- +1년
	   adddate('2021-06-20 00:00:00',INTERVAL 1 MONTH), 	-- +1달
       adddate('2021-06-20 00:00:00',INTERVAL 1 WEEK),   	-- +1주
       adddate('2021-06-20 00:00:00',INTERVAL 1 DAY),   	-- +1일
       adddate('2021-06-20 00:00:00',INTERVAL 1 HOUR),      -- +1시간
	   adddate('2021-06-20 00:00:00',INTERVAL 1 minute), 	-- +1분
	   adddate('2021-06-20 00:00:00',INTERVAL 1 second)		-- +1초
from dual;       

select '2021-06-20 00:00:00',
	   subdate('2021-06-20 00:00:00',INTERVAL 1 YEAR), 		-- 21년에서 20년으로 바뀜
	   subdate('2021-06-20 00:00:00',INTERVAL 1 MONTH), 	-- 6월에서 5월로 바뀜 (2021-05-20)
       subdate('2021-06-20 00:00:00',INTERVAL 1 WEEK),   	-- 1주일 뒤 날짜로 바뀜(2021-06-13 00:00:00)
       subdate('2021-06-20 00:00:00',INTERVAL -1 DAY),   	-- 1일 전 날짜로 바뀜(2021-06-21 00:00:00)
       subdate('2021-06-20 00:00:00',INTERVAL 1 HOUR),      -- 1시간 바뀜 2021-06-19 23:00:00
	   subdate('2021-06-20 00:00:00',INTERVAL 1 minute), 	-- 2021-06-19 23:59:00
	   subdate('2021-06-20 00:00:00',INTERVAL 1 second)		-- 2021-06-19 23:59:59
from dual;

-- dateDIFF(): 두 날짜간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차
select datediff('2021-06-21 01:05:05','2021-06-21 01:00:00'), -- 일수
	   timediff('2021-06-21 01:05:05','2021-06-20 01:00:00')  -- 초단위
from dual;

select datediff('2025-09-05','2025-03-27') -- 162 
from dual; -- 수업기간 몇일(공휴일 포함)

select first_name,
	   -- datediff(now(),hire_date)
       datediff(now(),hire_date)/365,
	   concat(ceil(datediff(now(),hire_date)/365), '년차')
	   -- concat(ceil(datediff(now(),hire_date)/365))as '연차',
from employees;

-- --------------------------------------------------------
-- * 단일행함수: 변환함수: 날짜(시간)→문자열
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select  now(), 										-- 2025-05-26 17:36:31
		date_format(now(),'%y-%m-%d %h:%i:%s'),     -- 25-05-26 05:36:31
	    concat(date_format(now(),'%Y-%m-%d %H:%i:%s'))as '날짜', -- 2025-05-26 17:36:31
        date_format(now(), '%Y-%m-%d %h:%i:%s (%p)'), -- 2025-05-26 05:36:31 (PM)
        date_format(now(), '%Y-%m-%d %H:%i:%s'),		-- 2025-05-26 17:36:31
        date_format(now(), '%Y/%m/%d %H %i %s')			-- 2025/05/26 17 36 31
from dual;

select first_name,
       date_format(hire_date, '%d.%m.%Y %H:%i:%s') as hire_date
from employees;   

/* 247부터 249 의 '결과값' 은 252번부터 254번 처럼 보여짐
first_name  |   hire_date
Steven		|	17.06.2003 00:00:00
Neena		|	21.09.2005 00:00:00
*/
-- --------------------------------------------------------

-- 원래 문자열 --> 날짜형(자동으로 변환)
select datediff('2021-Jun-22','2021-06-21')
from dual;

-- 변환함수: 문자열→날짜(시간)
-- STR_TO_DATE(str, format): str를 format형식으로 변환
select str_to_date('2021Jun-22 07:48:52', '%Y%b-%d'), 			-- 2021-06-22
	   str_to_date('2021-06-01 12:30:05', '%Y-%m-%d'),			-- 2021-06-01
	   datediff(str_to_date('2021-Jun-22 07:48:52', '%Y%b-%d'), 
				str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')); 
                
-- 숫자 --> 문자열
-- * format(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력              
select  format(1234567, 0),  -- 1,234,567
		format(1234567.89, 4),  -- 소수점자리수 반올림 (1,234,567.8900)
		format(1234567.89, -5)  -- 소수점 자리수(-는 안됨) 반올림
from dual;        

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select  first_name,
		commission_pct, ifnull(commission_pct,0)
from employees;

select  commission_pct, 
		ifnull(commission_pct,"없음")
from employees;

select first_name,
	    manager_id,
		ifnull(manager_id,"매니저없음")
from employees;