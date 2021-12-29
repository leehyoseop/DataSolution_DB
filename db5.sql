--***서브쿼리
--select문 안에서 다시 select문을 사용하는 기술
--하나의 sql문 안에서 다른 sql문이 중첩되는 질의문
--보통 데이터가 대량일때 데이터를 모두 합쳐서 연산하는 join보다 
--필요한 데이터만 찾아서 공급해주는 subquery의 성능이 더 좋음.

--주질의(main query)와 부속질의(subquery)로 구성됨
select s_name, s_price
    from snack
    where s_price < (
        select avg(s_price)
        from snack
    );
    
--최고가
select max(s_price) from snack; 
--제일 비싼 과자의 이름, 제조사, 가격
select distinct s_name, s_company, s_price 
    from snack 
    where s_price = (
        select max(s_price)
        from snack
    );
--제일 싼 과자는 어디서 만드는지 조회
select s_company 
    from snack 
    where s_price = (
        select min(s_price)
        from snack
    );
--평균가보다 비싼 과자는 몇개인지
select count(s_no)
    from snack
    where s_price > (
        select avg(s_price)
        from snack
    );
--유통기한이 가장 오래남은 과자의 전체 정보
select * 
    from snack
    where s_date = (
        select max(s_date)
        from snack
    );
    
create table snackco(
co_no number(5) not null, 
co_name varchar2(15 char) primary key not null,
co_address varchar2(30 char) not null,
co_people number(5) not null 
);
drop table snackco;
create SEQUENCE co_seq;
drop sequence co_seq;
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, '크라운', '미국 로스앤젤레스',400);
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, '해태', '캐나다 토론토',300);
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, '농심', '유럽 파리',200);
select * from snackco;

select s_name,s_price
    from snack
    where s_company = (
        select co_name
            from snackco
            where co_people = (
                select min(co_people)
                from snackco
            )  
    );
    
--제일 비싼 과자를 만드는 회사는 어디있는지 조회
select co_address
    from snackco
    where co_name in (
        select s_company
            from snack
            where s_price = (
                select max(s_price)
                from snack
            )
    );
--서울에 있는 회사에서 만드는 과자 평균가 조회
select avg(s_price)
    from snack
    where s_company = (
        select co_name
            from snackco
            where co_address = '유럽 파리'
    );
--평균가 이상의 과자를 만드는 회사이름, 위치
select co_name, co_address
    from snackco
    where co_name in (
        select s_company
            from snack
            where s_price >= (
                select avg(s_price)
                from snack
            )
    );