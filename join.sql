--join
--  하나의 명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능
--  마치 하나의 테이블인것처럼 보여주는 것.

create table tr1(name varchar2(20 char), age number(3));
create table tr2(name varchar2(20 char), age number(3));
drop table tr2;

insert into tr1 values('김비버', 30);
insert into tr1 values('박비버', 35);
insert into tr1 values('최비버', 40);
insert into tr1 values('오비버', 45);

insert into tr2 values('김비버', 30);
insert into tr2 values('이비버', 50);
insert into tr2 values('정비버', 55);

--cross join : 별도의 조건 없이 두 테이블간의 가능한 모~~든 결과를 조회(모든 경우의 수)
--사실상 안쓰는 조인
select * from tr1, tr2;
select * from tr1 cross join tr2;
--inner join : 조건에 해당하는 값만 나옴
select * from tr1 inner join tr2 on tr1.name = tr2.name;
select * from tr1 a, tr2 b where a.name = b.name; -- equi 조인(동등 조인)
select * from tr1 join tr2 using(name); --equi조인 ~ using(조인대상 칼럼명)
select * from tr1 natural join tr2; --자연조인, 조건절 없이 양쪽에 같은 이름을 가진 동일한 컬럼만을 조회

--outer join : 기준 테이블의 데이터가 모두 조회 되고,
                대상 테이블에 데이터가 있을 경우에 해당 컬럼의 값을 가져오기 위해서!

--(+)를 이용한 outer join : null이 출력되는 테이블의 컬럼에 (+)기호 추가

--left outer join : 왼쪽테이블에 값이 있을 시 오른쪽 테이블이조건에 맞지 않아도 값이 나옴(조건에 맞지 않으면 null)
select * from tr1 left outer join tr2 on tr1.name = tr2.name;
select * from tr1, tr2 where tr1.name = tr2.name(+);
--right outer join : 오른쪽테이블에 값이 있을 시 왼쪽 테이블이조건에 맞지 않아도 값이 나옴(조건에 맞지 않으면 null)
--full outer join : 왼쪽테이블에 값이 있을 시 다른쪽 테이블이 조건에 맞지않아도 값이 나옴
select * from tr1 full outer join tr2 on tr1.name = tr2.name;

--self join **헷갈림
--하나의 테이블내에 있는 컬럼끼리 연결하는 조인이 필요한 경우
--단어 뜻대로 스스로 join한다
create table member(
    m_id varchar2(10 char) primary key,
    m_name varchar2(10 char) not null,
    m_manager varchar2(10 char) 
);
insert into member values('member1', '회원1', 'manager1');
insert into member values('member2', '회원2', 'manager1');
insert into member values('member3', '회원3', 'manager1');
insert into member values('member4', '회원4', 'manager2');
insert into member values('member5', '회원5', 'manager2');
insert into member values('manager1', '관리자1', 'null');
insert into member values('manager2', '관리자1', 'null');

select * from member; 

--이 테이블 내에서 각 관리자가 어떤 회원을 관리하는지 알고 싶음
select m_id, m_name, m_manager from member
    where m_manager in (select m_id from member);
    
select * from member a join member b
    on a.m_id = b.m_id;

select a.m_id, a.m_name, b.m_id "member_id"
    from member a join member b --같은 테이블이지만 셀프조인을 하기위해서 테이블에 각각 별칭을 넣어줌!
    on a.m_id = b.m_manager; --계정id와 관리자 계정이 같은 값들을 연결해서 관리자가 관리하는 회원의 id값을 가져올수 있게 구현


