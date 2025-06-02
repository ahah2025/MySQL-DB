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
	book_id		int				primary key, -- primary key는 값을 중복으로 허용하지 않는다
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
-- insert into author(author_id,author_name,author_desc) 
-- values (1, '박경리', '토지 작가' );

insert into author
(author_id,author_name,author_desc) 
values (1, '박경리', '토지 작가' );

insert into author    -- 오류
values (2, '이문열');   -- 컬럼수와 데이터 수가 맞지 않음

insert into author 		-- 데이터 갯수를 맞춰야 함
values (2, '이문열','');  -- 작가설명에 ''가짜글자 데이터를 입력한것임
			-- 이문열, 다음에 3번째 내용이 없어도 ''를 표시해서 null이 아닌 '아무것도 없는 데이터'추가



insert into author 			-- 데이터 갯수를 맞춰야 함
values (7, '박명수', null);   -- 작가설명에 null 이라고 입력해도 빈칸으로 보여짐



insert into author
values(3, '이아름','학생');

-- 칼럼 명을 표시하면 데이터가 칼럼 명과 일치해야 한다
insert into author(author_id,author_name) -- id,name 을 괄호()안에 적어주면 values에 2개의 값만 기재 할 수 있음
-- 74번 라인 "정상"
values(4, '정우성');

insert into author(author_id,author_desc) -- 오류 author_name -- > not null
values(5,'런닝맨');						  -- author_name 데이터가 꼭 있어야 한다

insert into author(author_name,author_desc) -- 오류 author_id --> pk (unique -> not null)
values('유재석','런닝맨');						-- author_id 데이터가 꼭 있어야 한다(유니크해야 한다)

insert into author(author_desc, author_name, author_id)
values('Student','이효리',6);

select * 
from author;

-- 책 테이블 만들기
create table book(
	book_id		int				primary key, -- primary key는 값을 중복으로 허용하지 않는다
    title 		varchar(100)	not null,
    pubs 		varchar(100),
	pub_date	datetime
);