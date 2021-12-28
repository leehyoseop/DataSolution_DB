--과자 테이블
--과자 이름, 과자 회사, 과자 가격
CREATE TABLE snack(
s_no number(4) primary key,
s_name varchar2(15 char) not null,
s_company varchar2(10 char) not null,
s_price number(4) not null,
s_date date not null
);
select*from snack
--DML : 데이터 조작어
--데이터를 검색하거나 삽입하거나 수정, 삭제
--select insert update delete ...
--줄여서 C(insert)RUD라고 표현한다
--insert into [테이블명](컬럼명, 컬럼명 ...) values(값,값,...);

insert into snack(s_no, s_name, s_company, s_price) values(1,'초코파이','오리온',5000);
-- 컬럼 순서를 바꿔서 넣기 ? - 0

--컬럼명 명시안하고 순서대로 넣기도 0
insert into snack(s_no, s_name, s_company, s_price) values(1,'초코파이','오리온',5000);
insert into snack(s_no, s_name, s_company, s_price) values(2,'썬칩','농심',9000);
insert into snack(s_no, s_name, s_company, s_price) values(3,'빅파이','첵스',7000);
insert into snack(s_no, s_name, s_company, s_price) values(4,'고구마깡','나이키',8000);

select * from snack;
drop table snack cascade constraint;

--Factory pattern!
--MySQL : Autoincrement 옵션
--Oracle : Sequence
--		번호를 순서에 맞게 자동으로 생성해주는데..
--		테이블과는 무관하고, insert에 실패해도 sequence 값은 올라감

--sequence 생성
--create sequence 시퀀스명; --간단하게 만들기
--테이블명 뒤에 _seq를 붙여주는 문화가 있다
create sequence snack_seq;

--구체적인 시퀀스
--create sequence 시퀀스명
	increment by 1 -- 증가값(1씩 증가)
	start with 1 -- 시작값
	minValue -- 최소값
	maxValue -- 최대값
	nocycle/cycle -- 최대값에 도달하면 시작값부터 다시 반복 할지/말지
	nocache/cache -- 시퀀스를 미리 만들어놓고 메모리에서 가져다 쓸지/말지
	noorder/order -- n번 반복할지/말지
	
--sequence 삭제
drop sequence snack_seq;
----------------------------------------------------------------------
insert into snack values(snack_seq.nextval, '초코파이', '롯데', 5000);
insert into snack values(snack_seq.nextval, '초코파이', '오리온', 5000);
insert into snack values(snack_seq.nextval, '마이쮸', '해태', 5000);
insert into snack values(snack_seq.nextval, '썬칩', '롯데', 5000);
insert into snack values(snack_seq.nextval, '새콤달콤', '오리온', 900000);
insert into snack values(snack_seq.nextval, '마약김밥', '오리온', 900);

select * from snack;

drop table snack cascade constraint;
drop sequence snack_seq;

--시간 / 날짜
--	sysdate : 오늘날짜/현재시간
select sysdate from dual;
insert into snack values(snack_seq.nextval,'새콤달콤 딸기맛','크라운',500,sysdate);

--특정 시간/날짜
--내장함수 - to_date('값', '패턴')
--	패턴(대문자) - YYYY,MM,DD,AM/PM,HH,HH24(추천),MI(분),SS(초)
insert into snack values(snack_seq.nextval,'새콤달콤 딸기맛','크라운',500,
to_date('2022-02-15 17', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'새콤달콤 포도맛','해태',600,
to_date('2022-04-19 18', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'마이쮸','크라운',700,
to_date('2022-05-15 19', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'맛동산','해태',800,
to_date('2032-02-18 20', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'프링글스','크라운',900,
to_date('2042-02-15 21', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'포카칩','크라운',1000,
to_date('2052-04-15 22', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'아이셔','농심',1100,
to_date('2012-07-15 23', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'몽쉘','크라운',700,
to_date('2022-02-12 00', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'초코칩','해태',550,
to_date('2022-02-11 10', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'썬칩','크라운',900,
to_date('2022-02-13 15', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'조청유과','크라운',850,
to_date('2040-02-15 14', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'꼬북칩','농심',500,
to_date('2022-02-19 13', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'너구리','크라운',6500,
to_date('2022-02-15 12', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'진라면','해태',3500,
to_date('2022-02-16 11', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'신라면','크라운',500,
to_date('2030-02-15 1', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'프레첼','농심',2500,
to_date('2022-02-15 2', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'매운새우깡','크라운',500,
to_date('2022-02-28 3', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'고래밥','해태',1500,
to_date('2020-08-15 4', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'청포도 사탕','농심',500,
to_date('2022-12-15 5', 'YYYY-MM-DD HH24'));
insert into snack values(snack_seq.nextval,'새우깡','해태',200,
to_date('2021-11-15 6', 'YYYY-MM-DD HH24'));

select*from snack;

--이제 데이터를 조회해보자
--select [distinct] [컬럼명], [컬럼명 as 별칭 || 컬럼명 별칭], [연산자 사용], [통계함수],...
--	from [테이블명]
--	where [조건식]
--	group by [그룹대상]
	
--	having [함수포함조건]
--	order by [정렬대상 asc/desc(오름차순/내림차순)]
	
--과자 테이블 전체 조회
select * from snack;
select distinct s_company from snack;
-- => 컬럼명에 별칭을 부여해서 어떤 값인지 눈에 보이게 명시
select s_price/100 from snack;

select s_price/100 as price from snack;
select s_price/100 price from snack;

--연산자(산술연산자)
--Dual 테이블
--	1.오라클 자체에서 제공하는 더미테이블
--	2.간단하게 함수를 이용해서 계산 결과값을 확인할 떄 사용
--오라클에서는 숫자가 우선시됨
select 1+'3' from dual;
--숫자만 연산해줌 -> 숫자 + 숫자가아닌문자 = 에러
selecr 1+'a' from dual;

--문자를 더해주기 위한 연산자
select '3' || 10 from dual;
--1.숫자 함수
--	ABS(숫자) : 절대값 계산
--	ROUND(숫자,m) : 숫자 반올림, m은 반올림 기준 자릿수
--	POWER(숫자,n) : 숫자 n제곱을 계산
--	TRUNC(123.45,m) : m번째 자리까지 남기고 값을 버림
--	MOD(m,n) : 숫자 m을 n으로 나눈 나머지
--	SQRT(숫자) : 숫자의 제곱근을 계산(숫자는 양수!)

--2.문자 함수
--	CONCAT(s1, s2) : 두 문자열을 연결
--	SUBSTR(s1, n, k) : 문자열의 n번째부터 k만큼의 길이를 반환
--	INSTR(s1,s2,n,k) : 문자열 s1의 n번째부터 시작하여 찾고자하는 문자열 s2가 k번째에 나타나는 문자열의 위치를 반환
--	LPAD(s,n,c) : 문자열 s의 왼쪽부터 지정한 자리수 n까지 지정한 문자 c로 채움
--	RPAD(s,n,c) : 문자열 s의 오른쪽부터 지정한 자리수 n까지 지정한 문자 c로 채움
--	LTRIM(s1,s2) : 문자열 s1의 기준으로 왼쪽에 있는 지정한 문자 s2를 제거
--	RTRIM(s1,s2) : 문자열 s1의 기준으로 오른쪽에 있는 지정한 문자 s2를 제거
--	REPLACE(s1,s2,s3) : s1에서 지정한 문자 s2를 원하는 문자 s3로 변환
--	LENGTH : 글자 수를 세어주는 함수
--	LENGTHB : 글자의 용량(바이트)을 세어주는 함수

--3. 날짜/시간 함수
--[날짜 형식]
--YYYY : 4자리 연도
--MM : 월
--DD : 일
--DAY : 요일(월요일~일요일)
--DY : 요일(월~일)
--AM/PM : 오전,오후 나눠서
--HH, HH12 : 12시간
--HH24 : 24시간
--MI : 분
--SS : 초

--		-to_date(s1, datetime형식) : 문자형 데이터 -> 날짜형
--		-to_char(date, datetime형식) : 날짜형 -> 문자형
--		-add_months(date, 숫자) : 날짜에서 지정한 달만큼 더함(1:다음달, -1:이전달)
--		-last_day(date) : 그 달의 마지막날을 반환

select to_char(sysdate, 'YYYY')||'년' as 연도 from dual;
select to_char(sysdate, 'MM')||'월' as 월 from dual;
select to_char(sysdate, 'DD')||'일' as 일 from dual;
select to_char(sysdate, 'HH24')||'시'시, to_char(sysdate, 'MM')||'분'분 from dual;
--insert into snack values(snack_seq.nextval,'새콤달콤 딸기맛','크라운',500,sysdate);

--문자열 '2021-12-31 오전 06:00'을 2021.12.31로 조회
select to_char(to_date('2021-12-31 오전 06:00', 'YYYY-MM-DD PM HH:MI'),'YYYY.MM.DD') from dual;

--오늘 날짜 기준 3달전 마지막 날은 몇월 며칠인지
select to_char(last_day(add_months(sysdate, -3)),'MM-DD') from dual;

--4. 집계/분석 함수 select 필드명 / having 절에서 사용!
--	-AVG(필드명) : 평균
-- 	-COUNT(필드명) : 검색되는 데이터 수
--	-MAX(필드명) : 최대값
--	-MIN(필드명) : 최소값
--	-SUM(필드명) : 총 합
--	-RANK : 중복 순위만큼 다음 순위값을 증가시킴 12335
--	-DENSE_RANK : 중복순위가 존재해도 다음 순위값을 표기함 12334

--5. NULL 관련 함수
--	-NVL 함수 : NULL인 경우만 지정한 값으로 대치하는 함수
--		NVL(값, NULL일때 대체할 값)
--	-NVL2 함수 : NULL의 여부에 따라서 지정한 값으로 대치하는 함수
--		NVL(값, 값이 있을때 대체할 값, NULL일때 대체할 값)

--WHERE절(조건식)
--전체 데이터 중 지정한 조건에 맞는 데이터를 찾아주는 문장
--조건식에 사용할 연산자 (비교 연산자)
--=,!=,^=,<>,>,<,>=,<=,...

--가격이 3000원인 과자의 모든 정보를 조회
select * from snack where s_price = 3000;

--모든 과자 이름(가격)으로 조회
select s_name||'('||s_price ||'원'||')' as "이름(가격)" from snack;
--2000원 이하의 과자중에서 최소가격이 얼만지
select MIN(s_price) from snack where s_price<=2000;
--모든과자의 평균가가 얼마인지
select AVG(s_price) from snack;
--과자이름, 가격의 30% 할인된 금액 조회
select s_name, s_price*0.7 from snack;
--3000원 이하인 과자이름, 회사이름 조회
select s_name, s_company from snack where s_price<=3000;

