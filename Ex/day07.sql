-- 계정만들기

-- 모든곳에서 접속가능
create user 'web'@'%' identified by '1234';
		--   계정이름(web)        
-- localhost 에서만 접속가능
create user 'web'@'localhost' identified by '1234';        

-- 192.168.0.122 에서만 접속가능
create user 'web'@'192.168.0.122' identified by '1234'; 

-- 비밀번호 바꾸기
alter user 'web'@'%' identified by 'web';
