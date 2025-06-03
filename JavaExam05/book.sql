-- -------------------------
-- book  이아름
-- -------------------------

-- 1) 아래의 그림처럼 되도록 테이블 생성 쿼리문 작성
-- ERD

-- 계정 삭제
drop table author;
drop table book;

-- 작가 테이블 생성
create table author (
	author_id		int				PRIMARY KEY   auto_increment,
	author_name		VARCHAR(100)	NOT NULL,
    author_desc 	VARCHAR(500)
);

create table book(
	book_id 	int 			primary	key 	auto_increment ,
    title 		varchar(100)  	not null,
    pubs 		varchar(100),
    pub_date 	datetime,
    author_id	int             ,
    constraint  book_fk	foreign key(author_id)
    references  author(author_id)
	ON DELETE SET NULL
);

-- 데이터 조회
select * from author;
show tables;

-- 2) 아래의 그림처럼 되도록 데이터 입력 쿼리문 작성

-- author 테이블 데이터
-- 작가 데이터 입력
Insert into author 
values(1,'김문열','경북 영양');

Insert into author
values(2,'박경리','경상남도 통영');

Insert into author 
values(3,'유시민','17대 국회의원');

Insert into author
values(4,'기안84','기안동에서 산 84년생');

Insert into author
values(5,'강풀','온라인 만화가 1세대');

Insert into author
values(6,'김영하','알쓸신잡출연');

-- book 테이블 데이터
insert into book
values(1,'우리들의 일그러진 영웅','다림','1998-02-22',1);

insert into book
values(2,'삼국지','민음사','2002-03-01',1);

insert into book
values(3,'토지','마로니에북스','2012-08-15',2);

insert into book
values(4,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);

insert into book
values(5,'패션왕','중앙북스(books)','2012-02-22',4);

insert into book
values(6,'순정만화','재미주의','2011-08-03',5);

insert into book
values(7,'26년','재미주의','2012-02-04',5);

select * from book;

-- 김문열 -> 이문열   수정
update author 
set author_name = '이문열'
where author_id = 1;

-- 온라인 만화가 1세대 -> 서울특별시
update author 
set author_desc = '서울특별시'
where author_id = 5;

-- 4) 아래의 결과처럼 나오는 쿼리문 2개(where절, inner join 결과는 동일함)
-- 전체 조회
select  b.book_id,
		b.title,
        b.pubs,
        b.pub_date,
        b.author_id,
        a.author_id,
        a.author_name,
        a.author_desc
from book b, author a
where b.author_id = a.author_id;

-- 5) 아래의 결과처럼 나오는 쿼리문(김영하 작가도 나와야함)
insert into author
values(null,null,null,null,null,6,'김영하','알뜰신잡출연');

-- 6) 강풀작가의 설명의 데이터 변경(서울특별시 -> 온라인 만화가 1세대)  --> 이미지 첨부
-- 7) 김영하 데이터 삭제 쿼리문
delete from book
where author_id = 6;

-- 8) 기안84 데이터 삭제 쿼리문
delete from author
where author_id = 4;

/*
9) 기안84 데이타 삭제가 되지 않는 이유 (주석으로 작성)
10) 기안84 삭제할 수 있는 방법( 주석으로 작성)
*/