-- ----------------------------------------------------------
-- web 계정
-- ----------------------------------------------------------

-- 테이블 만들기
-- create table book(a, b, c, d);
create table book(
	book_id int,
    title varchar(50),
    author varchar(20),
    pub_date datetime
);

select * from book;

-- 테이블에 칼럼 추가
alter table book add pubs varchar(50);

-- 테이블에 칼럼 수정
alter table book modify title varchar(100); -- 텍스트 길이를 50 에서 100 으로 수정
alter table book rename column title to subject; --  title를 subject로 수정
 
-- 테이블에 칼럼 삭제
alter table book drop author;

-- 테이블 이름 수정
rename table book to article;  

-- 테이블 삭제
drop table article;

select * from article;

-- 작가 테이블 만들기
-- create table author ( , , );
create table author (
	author_id		int				PRIMARY KEY,
	author_name		VARCHAR(100)	NOT NULL,
	author_desc 	VARCHAR(500)
);

-- 책 테이블 만들기
create table book(
	book_id		int				primary key,
    title 		varchar(100)	not null,
    pubs 		varchar(100),
	pub_date	datetime,
    author_id int,
    CONSTRAINT book_fk FOREIGN KEY (author_id)
	REFERENCES author(author_id)
);

-- 작가 데이터 insert
-- insert 문
-- insert(추가)    author(테이블명)     values(추가할 내용 기재)
insert into author 
values (1, '박경리', '토지 작가' );

insert into author 
values (2, '이문열',''); -- 작가설명에 '' 데이터를 입력한것임
			-- 이문열 다음에 3번째 내용이 없어도 ''를 표시해서 null이 아닌 '아무것도 없는 데이터'추가

insert into author
values(3, '이아름','학생');

select * 
from author;