-- ----------------------------------------------------------
-- web 계정 -- 02
-- ----------------------------------------------------------

-- 테이블 삭제
drop table book;
drop table article;
drop table author;

-- 테이블 생성
create table author (
	author_id		int				PRIMARY KEY   auto_increment,
	author_name		VARCHAR(100)	NOT NULL,
    author_desc 	VARCHAR(500)
);

create table book(
	book_id int primary key,
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime
);    

-- author 데이터 입력
-- 기본
Insert into author(author_id,author_name,author_desc) 
values(1,'이문열','서울');

Insert into author
values(2,'정우성','서울');

-- 데이터 조회
select * from author;
show tables;

-- ------
Insert into author(author_id,author_name)
values(5,'박명수');

Insert into author
values(null, '이문열',null);

Insert into author(author_desc, author_name)
values('런닝맨','유재석');

-- ------------------------------------------------------
-- 레코드 삭제
-- where절에 primary key 칼럼 조건식으로 삭제

delete from author
where author_id = 3;

-- primary key 칼럼 이외의 칼럼은 기본적으로 삭제되지 않는다(옵션으로 조정할 수 있다)
delete from author
where author_name='이문열';


delete from author; -- 전체삭제의미(막혀있음)
-- ---------------------------------------------------
-- 데이터 수정

-- where 절이 없는 경우 모든 데이타가 바뀐다(기본은 막혀있음)
--

-- where 절을 꼭 써야 한다(pk로 조건절 작성)
update author set author_name = '기안84' ,
author_desc = '웹툰작가'
where author_id = 1;

update author 
set author_name = '서장훈',
	author_desc = '농구선수'
where author_id >= 1;


-- 데이터 조회
select * from author;
show tables;

/*
create table book(
	a,
    b,
    c,
    foreign key문법
);

*/

