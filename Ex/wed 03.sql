-- ----------------------------------------------------------
-- web 계정 -- 03 fk
-- ----------------------------------------------------------

-- 테이블 삭제
drop table authori;
drop table book;

-- 테이블 리스트 보기
show tables;

-- 테이블 생성
create table author(
	author_id 	int 			primary key 	auto_increment,
    author_name varchar(100)	not null, 
	author_desc varchar(500)
);

create table book(
	book_id 	int 			primary	key 	auto_increment ,
    title 		varchar(100)  	not null,
    pubs 		varchar(100),
    pub_date 	datetime,
    author_id	int,
    constraint  book_fk	foreign key(author_id)
    references  author(author_id)
);

-- 1)작가 데이터 입력
insert into author
values(null,'이문열','경북 영양');

insert into author
values(null,'박경리','경상남도 통영');

select * from author;

-- 2)책 데이터 입력
insert into book
values(null,'우리들의 일그러진 영웅','다림출판사','1988-02-22',1);

insert into book
values(null,'삼국지','민음사','2002-03-01',1);

insert into book
values(null,'토지','마로니에북스','2012-08-15',2);

-- 작가 테이블에 3번 작가가 없음
insert into book
values(null,'유시민의 글쓰기 특강','생각의길','2015-04-01',3);

-- 작가 2명, 책은 4
-- 전체 조회
select *
from book bo, author au
where bo.author_id = au.author_id;

-- 경북 영양 -> 서울
update author
set bo.author_desc = '서울',
	au.author_desc = '서울';

select * from book;