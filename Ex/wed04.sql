-- web				(2025-06-04)
-- ------------------------------------------------------
-- 데이타베이스(스키마) 리스트 보기
show databases;

-- web_db 접속
use web_db;

-- 테이블 리스트 보기
show tables;

-- 데이타 조회
select  author_id,
		author_name,
        author_desc
from author
;
-- ------------------------------
-- 데이터 추가
Insert into author 
values(null,'정우성','서울');

-- 데이터 삭제
delete from author
where author_id = 8
;

-- 데이터 수정
update author
set author_name = '기안84',
	author_name = '김기태'
where author_id = 4
;  

