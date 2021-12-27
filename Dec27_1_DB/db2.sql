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