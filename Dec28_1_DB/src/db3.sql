--[옵션]
--제약조건(Constraint) 이라고 부름
--데이터 무결성을 보장하기 위해서 사용
--		데이터 무결성 : 데이터베이스에 저장된 데이터의 일관성, 정확성을 지키는 것
--	1.도메인 무결성 제약조건
--		도메인 제약(Domain Constraint)이라고도 하며,
--		릴레이션 내의 튜플들이 도메인에 지정된 값만 가져야 한다는 조건
--		자료형(type), 널(null/not null), 기본값(default), 체크(check)
--	2.개체 무결성 제약조건
--		기본키 제약이라고함
--		릴레이션은 기본키를 지정하고, NULL값을 가져서는 안되며,
--		릴레이션 내에 오직 하나의 값만 존재해야 한다는 조건
--	3.참조 무결성 제약조건
--		외래키 제약이라고함
--		참조받는 릴레이션의 외래키는 참조하는 릴레이션의 기본키와 도메인이 동일해야하며,
--		참조받는 릴레이션의 값이 변경될때, 참조하는 릴레이션의 제약을 받는다.

--> not null / primary key /foreign key

--1. NOT NULL : (null은 값이 비어있다 / 0도 아니고 띄어쓰기도 아닌 정말 값을 넣지 않은 상태)
--		NULL을 허용하지 않는다 -> 필수적으로 값을 넣어줘라! (가장 많이 사용 O)

create table example(
	col1 varchar2(10 char),
	col2 varchar2(10 char) not null
);
create table example(
	col1 varchar2(10 char),
	col2 varchar2(10 char)
	constraint col2_notnull not null
);
select * from example;

--2. Unique	: 해당 컬럼에 들어가는 값이 테이블 전체에서 유일해야 한다!는 의미
--	Not null과 함께 사용이 가능하지만, unqiue는 잘 사용되지 않음

create table example(
	col1 varchar2(10 char) unique,
	col2 varchar2(10 char) unique not null,
	col3 varchar2(10 char)
	constraint col3_unique unique(col3)
);

--3. Primary key(기본 키) : Null값을 허용하지 않고, 중복된 데이터를 허용하지 않음. 
--	(not null + unique = primary key)
--	데이터 특정 조건을 검색하거나, 수정등의 작업을 할때 기본키로 구분한다.
--	ex) ID, 주민등록번호, 회원번호, 글 번호, ...
--	가급적이면 한 테이블당 PK는 하나였으면..!

create table example4(
	col1 varchar2(10 char) primary key,
	col2 varchar2(10 char),
	col3 varchar2(10 char)
);

/*PK를 2개 이상 줘야하는 경우 constraint 키워드 사용 + PK는 가급적이면 하나였으면..*/
create table exmple5(
	col1 varchar2(10 char),
	col2 varchar2(10 char),
	col3 varchar2(10 char)
	constraint pk_example5 primary key(col1, col2)
);

--4. foreign key(외래 키) : 다른 테이블의 특정 컬럼을 조회해서
--						동일한 데이터가 있는 경우에만 입력, 수정,...가능
--	참조하는 테이블은 PK나 unique로 지정된 컬럼만을 FK로 지정할 수 있다!
--	외래키 설정을 위해서는 참조받는 컬럼이 먼저 생성되어야하고, 외래키를 심을 테이블이 이후에 생성되어야함

create table example6(
	col1 varchar2(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');

select*from EXAMPLE6;
-- 외래키 테이블 구조
--create table 테이블명(
--  컬럼명 자료형,
--   constraint FK명 foreign key(컬럼명)
--     references 대상테이블명(대상테이블의 기본키( OR 고유키) 컬럼명)
--      [on delete set null || on delete cascade] -- (선택 옵션이야)
      -- 참조하는 테이블에서 행 부분을 지웠을 때,
      -- 이 테이블에서 연결되어 있는 행에 대해서 null값을 먹일지
      -- 아니면 같이 지울지에 대한 옵션
);

create table example6(
   col1 varchar2(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');
select * from EXAMPLE6;

create table example7(
   col1 varchar2(10 char),
   constraint fk_col1 foreign key(col1)
      references EXAMPLE6(col1)
      on delete cascade
);
insert into example7 values('10');
insert into example7 values('20');
insert into example7 values('30');
insert into example7 values('40'); -- example6에는 40이라는 값이 없으므로 외래키가 먹히지 않는 상황!
select * from example7;
-- example6에 '10'인 값을 지우면 어떻게 될까?
delete from example6 where col1 = '10'; -- examle7의 '10'의 값은 외래키 안먹히는 상황 됨!

create table department(
	dpcode varchar2(5 char) primary key,
	dpname varchar2(5 char)	
);
--drop table department;
create table student(
	stcode varchar2(5 char) primary key,
	stname varchar2(5 char) not null,
	dpcode varchar2(5 char),
	constraint fk_dpcode foreign key(dpcode)
		references department(dpcode)
		on delete cascade
);

insert into department values('123', '화학공학과');
insert into department values('456', '의상학과');
insert into department values('789', '실용음악과');
select * from DEPARTMENT;
insert into student values('1111', '이효섭', '123');
insert into student values('2222', '김효섭', '123');
insert into student values('3333', '박효섭', '456');
insert into student values('4444', '심효섭', '789');
select * from student;
delete from DEPARTMENT where dpcode = '123';

--5. check : 데이터의 값의 범위나 조건을 설정하여 조건에 해당하는 데이터만 허용한다.
CREATE TABLE example8(
	col1 number(10)
	constraint
);

--6. default : 아무런 데이터를 입력하지 않았을 경우, 지정한 데이터가 자동으로 입력됨.
create table example9(
	col number(3) default 999 not null
);

insert into example9 values(default);
insert into example9 values(null);
insert into example9 values(0);
insert into example9 values(11);
insert into example9 values('');
select*from example9;

CREATE TABLE coffee_menu(
name varchar2(10 char) PRIMARY KEY,
price number(7) not null,
cal number(4,1) not null,
start_date date not null,
)

--DDL - Alter, Drop (비교적 쉬움)
--데이터 타입 변경 / 컬럼의 크기 변경
--alter table [테이블명] modify [컬럼명] [데이터타입(용량)];
-- 값이 있는 상태에서 데이터타입 변경하면 에러!
alter table coffee_menu modify name number(3);
--값이 있는 상태에서 용량을 적게 변경하면 에러!
alter table coffee_menu modify name varchar2(2 char);

--컬럼명 변경
--alter table [테이블명] rename column [이전 컬럼명] to [새로운 컬럼명];
--alter table coffe_menu rename column c_name to c_name2;
--alter table [테이블명] add [컬럼명] [데이터타입(용량)] [제약조건(생략가능)];
--alter table coffee_menu add taste varchar2(10 char) not null;

--컬럼 삭제
--alter table[테이블명] drop column [컬럼명];
alter table coffee_menu drop column taste;

--drop
--테이블을 삭제! (휴지통에 넣기)
--drop table [테이블명] cascade constraint;

--휴지통에 있는 테이블 복원
--flashback table [테이블명] to before drop;
--휴지통 비우기
purge recyclebin;
