-- ----------------------------------------------------------
-- web 계정 -- 03 foreign key
-- ----------------------------------------------------------
-- 테이블 삭제
drop table author;
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
	ON DELETE SET NULL
);

/*
ON DELETE CASCADE: 해당하는 FK를 가진 참조행도 삭제
ON DELETE SET NULL: 해당하는 FK를 NULL로 바꿈
*/

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

select * from book;

-- 작가 2명, 책은 4
-- 전체 조회
select *
from book bo, author au
where bo.author_id = au.author_id;

-- 경북 영양 -> 서울   수정
update author 
set author_desc = '서울'
where author_id = 1;

-- 우리들의 일그러진 영웅 책 삭제 
delete from book
where book_id = 1;

-- 작가 박경리 삭제 안됨       작가번호 2번을 책에서 사용하고 있음
delete from author
where author_id = 2;

-- -------------------------------------
-- 작가 정우성 추가
insert into author
values(null,'정우성','영화배우');

-- 삭제 잘됨    작가번호 3번을 책에서 사용하고 있지 않음Add commentMore actions
delete from author
where author_id = 3;
-- --------------------------------------
/*
DCL(ctrol=조작) : 계정만들기, 권한부여
DDL : 데이터베이스관련(수정,삭제), 테이블 관리
DML : INSERT(등록)/UPDATE(수정)/DELETE(삭제)/조회(89-91 라인) 
*/

-- 전체 조회
select *
from book bo, author au
where bo.author_id = au.author_id;

-- 전체 조회(실전코드)     컬럼명을 모두 명확하게 표기해준다.  * 사용하지 않는다
select  bo.book_id,
		bo.title,
        bo.pubs,
        bo.pub_date,
        bo.author_id,
        au.author_id,
        au.author_name,
        au.author_de
from book bo, author au
where bo.author_id = au.author_id;