-- root 계정 만들기
-- 모든곳에서 접속가능
create user 'web'@'%' identified by '1234';
		--   계정이름(web)      
        
-- localhost 에서만 접속가능
create user 'web'@'localhost' identified by '1234';        

-- 192.168.0.122 에서만 접속가능
create user 'web'@'192.168.0.122' identified by '1234'; 

-- 계정 비번 변경
-- alter 

/*
my sql -uweb -p
----> 'web'@'192.168.0.122' 로그인 하는거다
----> 로그인 우선순위 'web'@'192.168.0.122'   >  'web'@'localhost'  >  'web'@'%'
*/

-- #계정 삭제
drop user 'web'@'192.168.0.122' ;

drop user 'web'@'localhost';

drop user 'web'@'%';

use mysql;

select user, host
from user;


-- 비밀번호 바꾸기
alter user 'web'@'%' identified by 'web';




-- ----------------------------------------------
-- 데이타베이스/테이블 관리
create database web_db
	default character set utf8mb4
	collate utf8mb4_general_ci
	default encryption='n'
;

-- 데이터베이스 조회
show databases ;

-- 데이터베이스 선택
use web_db;
-- --------------------------------------------------
-- 권한부여
-- web_db 데이타베이스의 모든 테이블에 'web'@'%' 사용자에게 모든 권한 부여
grant all privileges on web_db.* to 'web'@'%' ;

-- 일부만 권한부여     web'@'% 계정이 hr_db에 있는 employees 에 있는것에 권한부여
grant select,insert on hr_db.employees to 'web'@'%' ;




