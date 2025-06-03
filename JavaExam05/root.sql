-- -------------------------
-- root  이아름
-- -------------------------

/*
아래의 설명대로 계정과 데이터베이스 만드는 쿼리문을 작성하세요
- 계정명은 book 입니다. 
- book 계정은 모든 아이피에서 접속 가능해야 합니다. 
- book 계정이 book_db 데이터베이스의 모든 권한을 가져야 합니다. 
- 데이터베이스명은 book_db 입니다.
*/

-- #계정 만들기
-- 모든 아이피에서 접속 가능
create user 'book'@'%' identified by '1234';

-- book 계정이 book_db 데이터베이스의 모든 권한을 가져야 합니다. 
grant all privileges on book_db.* to 'book'@'%' ;
flush privileges;

-- 데이터베이스명은 book_db 입니다.
create database book_db
	default character set utf8mb4
	collate utf8mb4_general_ci
	default encryption='n';
    
-- #데이터베이스(스키마) 삭제
drop database book_db;

-- #데이터베이스 조회
show databases ;    