--주석

--Java : 실행 -> 모든 소스가 다 실행
--sql연습장 : 원하는 줄만 골라서 실행 O
--여러줄을 실행하고 싶으면 그 줄들을 다 덮어서 alt+x;
create table dec27_test(
	name char,
	age number
);
--한줄 실행할때는 alt+s;
select * from dec27_test;

drop table dec27_test cascade constraint purge;

create table person(
	p_name varchar2(10 char),
	p_age number(3),
	p_gender varchar2(2 char)
);

insert into PERSON values('홍길동', 10, '남자');
insert into PERSON values('홍길동', 10, '남자');
insert into PERSON values('김길동', 30, '여자');
insert into PERSON values('최길동', 20, '남자');
insert into PERSON values('최길동', 100, '남자');

select*from person;


--중복값 없애고 조회
select distinct*from person;
--용어정리!
--테이블 (=릴레이션) : 데이터베이스에서 정보를 구분해서 저장하는 기본적인 단위
--	행과 열로 이루어진 데이터들의 집합
--	행(Row) : 테이블을 구성하는 데이터들 중 가로부분, 튜플 / 레코드라고도 부름. 
--	열(Column) :	필드(Field) / 속성(Attribute)이라고 부름.
--	스키마(Schema) : 데이터베이스의 기본 구조를 정의하는 것. 쉽게 말하면 제목부분 테이블의 헤더를 나타내며, 속성과 자료타입을 갖고있음.
--	인스턴스(Instance) : 테이블에서 실제로 저장된 데이터의 값
--	도메인 : 속성이 가질 수 있는 값의 집합
--	특정 속성에서 사용할 데이터의 범위를 사용자가 정의 

--릴레이션의 특징
--1.속성은 단일값만 가진다
--	각 속성의 값은 도메인에 정의된 값만 가지며, 그 값은 모두 다 단일해야!!!
--2.속성은 서로 다른 이름을 가진다.
--	컬럼명 중복오류! -> 이름을 중복해서 만들지 않기!
--3.한속성의 값은 모두 같은 도메인 값을 가진다
--4.속성의 순서는 상관없다. 순서만 바뀌었지 , 내용에는 변화가 없는 상태이다.
--5.릴레이션 내에 중복된 튜플은 허용되지 않는다. 
--즉 모든 튜플에는 차별성이 필요함 에를들어, 생일이나 핸드폰 번호를 추가해서..!

--SQL명령문의 종류! : 
--데이터 정의어(테이블이나관계의 구조를 생성하는데에 사용된다 / create.drop.alter)
--데이터 조작어(테이블에 데이터를 검색, 삽입, 수정 / select(질의어 혹은 쿼리라고도 한다), update delete)
--데이터 제어어(data control language데이터 베이스에 접근하고 사용하도록 권한을 준다.) revoke, grant)
--트랜잭션 처리어 : DML에 의해 조작된 결과를 작업단위 별로 제어하는데 사용. 커밋,롤백,세이브포인터

--SQL이라는 언어로 DB를 제어해볼건데
--	DB메이커는 달라도, SQL문법은 거의 비슷
--	대/소문자 구별하지 않음
--		->다 대문자로 받아들임
--		->낙타체가 안통함 뱀체로 사용!
--		->데이터는 구별함! 소문자와 대문자 구별!

--테이블을 제대로 만들어보자!
--	테이블의 구조...ㅎ
create table 테이블명(
	컬럼명 자료형 [옵션], -- 옵션은 필요하면 넣는것 ,로 구분
	컬럼명 자료형,
	***
);

--자료형 (데이터타입)
--크게 3가지로 나눌 수 있음
--문자형
--char(용량)
--	무조건 그 용량대로 저장
--	용량이 비어있다면, 띄어쓰기로 그 용량을 메꿈
--	처리속도가 빠르다
--varchar2(용량)
--	정해진 용량만큼 데이터를 안넣으면
--	그 용량을 조절해서 저장
--	주력으로 사용!
--	용량을 조절하는 만큼 처리속도가 느리다!(비교적)
--	ex) 이름, 주소
--문자형 용량
--	varchar2(5) : 5bytes 만큼의 용량을 넣을 수 있다
--	영어,숫자,띄어쓰기 : 1byte
--	한글 1글자 : 3byte
--	글자수 계산하기가 살짝 애매...
--	varchar2(5 char) : 한글/영어 5글자 -> 15byte
-- => 문자형 자료형을 쓸 때는 용량에 'char'를 넣어쓰자!

create table test2(
	t_name varchar2(5)
);
create table test3(
	t_name varchar2(5 char)
);

insert into test2 values('가나다');
insert into test3 values('가나다');

drop table test2 cascade constraint purge

--숫자형
--Number(P,S) : 십진수 기준
--		P : 정밀도(Precision), S : 범위(Scale)
--		P는 소수점 기준 모든 유효숫자 자리수를 의미 -> P에 명시된 것보다 큰 숫자값 -> 에러!
--		S가 양수이면 소수점 이하, 음수면 소수점 이상(소수점 기준 왼쪽) 유효숫자 자리수를 나타냄
--		S에 명시한 숫자 이상의 숫자를 입력하면, S에 명시한 숫자로 반올림 처리!
--		값이 123.54인데
--		number(3)		124
--		number(3,2)		에러
--		number(5,2)		123.54
--		number(7,1)		
--		number(7,-1) 	

--		Float(P) : 이진수 기준

create table testNum(
	t_num number(5),
	t_no float(5)
);

insert into testNum values(12345,12345);
select*from testNum;
--float(5) 5자리 10진수(X) 5자리 2진수(O)
--5자리 이진수 -> 10진수로 변경하려면 0.3정도를 곱하면 됨
--5 x 0.3 = 약 1.5
--float(5)는 실제로 float(2) -> 1.5를 반올림해서 2
--12345 중 앞의 두자리 12만 제대로 나오고, 나머지는 0으로 메꿔준 상황
--=> 사실상 number / 크기 설정 -> P,S를 적절히 조절해서!

--날짜형
--Date : 연도 월 일 시 분 초까지 입력이 가능하다
--Timestamp : 연도 월 일 시 분 초 밀리초까지 입력이 가능하다
-- => 주력은 Date를 사용한다.
--select sysdate from dual;

--ROWID 타입
--	테이블에서 행의 위치를 지정하는 논리적인 주소값
--	데이터베이스 전체에서 중복되지 않는 유일한 값
--	테이블에 새로운값이 생성되면 자동적으로 생성
--	데이터베이스 저장 X
--	조회는 가능, 변경은 불가능

select rowid from dual;
--앞에서부터 6글자 : 데이터 객체번호
--		데이터 객체 생성시 할당
--그 다음 3글자 : 상대적 파일 번호
--	데이터가 저장되는 물리적인 파일번호
--그 다음 6글자 : 블록번호
--	데이터 파일내에서 행을 포함하는 블록위치
--그 다음 3글자 : 행 번호
--	블록 헤더내에서 행 슬롯의 위치
--가상의 주소값!