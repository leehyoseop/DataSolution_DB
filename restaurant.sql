--요식업 프랜차이즈
--홍콩반점 서초점은 홍길동이 운영 100석
--홍콩반점 부천점은 김길동이 운영 80석
--한신포차 강남점은 홍길동이 운영 150석
--선릉포차 선릉점은 최길동이 운영 130석

--홍길동, 1950-03-01일생 ,남자
--김길동, 1992-02-01일생 ,여자
--홍길동, 1991-12-12일생 ,여자
--최길동, 1989-07-14일생 ,남자

create table restaurant(
    r_ceono number(4) primary key,
    r_name varchar2(10 char) not null,
    r_address varchar2(5 char) not null,
    r_owner_name varchar2(5 char) not null,
    r_sit number(4) not null
);

create table res_owner(
    ceono number(3) primary key,
    o_name varchar2(5 char) not null,
    o_birth date not null,
    o_gender varchar2(3 char) not null
);

insert into restaurant values(11,'홍콩반점', '서초', '홍길동', 100);
insert into restaurant values(22,'홍콩반점', '부천', '김길동', 80);
insert into restaurant values(33,'한신포차', '강남', '홍길동', 150);
insert into restaurant values(44,'선릉포차', '선릉', '최길동', 130);

insert into res_owner values(11,'홍길동', to_date('1950-03-01', 'YYYY-MM-DD'), '남자');
insert into res_owner values(22,'김길동', to_date('1992-02-01', 'YYYY-MM-DD'), '여자');
insert into res_owner values(33,'홍길동', to_date('1991-12-12', 'YYYY-MM-DD'), '여자');
insert into res_owner values(44,'최길동', to_date('1989-07-14', 'YYYY-MM-DD'), '남자');

select * from restaurant;
select * from res_owner;
drop table restaurant;
drop table res_owner;

--좌석 수 제일 많은 식당 운영하는 사람 정보를 전부 조회
select *
    from res_owner
    where ceono = (
        select r_ceono
        from restaurant
        where r_sit = (
            select max(r_sit)
            from restaurant
        )
    );

--메뉴번호 / 메뉴 이름 / 메뉴 가격 / 메뉴 파는 식당 번호
create table menu(
    m_num number(3),
    m_name varchar2(10 char),
    m_price number(5),
    m_ceono number(4)
);
insert into menu values(99,'짜장면', 5500,11);
insert into menu values(98,'짬뽕', 5500,11);
insert into menu values(97,'고추잡채', 9500,11);
insert into menu values(96,'꿔바로우', 13000,11);
insert into menu values(95,'간짜장면', 6000,11);
insert into menu values(94,'사천짜장', 8000,22);
insert into menu values(93,'울면', 7000,22);
insert into menu values(92,'탕수육', 15000,22);
insert into menu values(91,'멘보샤', 30000,22);
insert into menu values(90,'짜장면', 6000,22);
insert into menu values(89,'계란찜', 3000,33);
insert into menu values(88,'모래집', 4000,33);
insert into menu values(87,'닭발', 5000,33);
insert into menu values(86,'오징어땅콩', 1000,33);
insert into menu values(85,'불족발', 16000,33);
insert into menu values(84,'카레라이스', 10000,44);
insert into menu values(83,'오돌뼈볶음', 9500,44);
insert into menu values(82,'연어회', 6900,44);
insert into menu values(81,'샐러드', 8900,44);
insert into menu values(90,'문어', 9900,44);

select * from menu;

--프랜차이즈 메뉴 전체이름, 가격
--  을 오름차순 -> 메뉴명 가나다 역순 조회
select m_name, m_price
    from menu
    order by m_price asc, m_name desc;
-- 전체 사장님들 이름, 생일 조회
select o_name, o_birth
    from res_owner;
--프랜차이즈 식당이 몇 개 조회
select count(*)
    from restaurant;
--프랜차이즈 메뉴 전체의 평균가 조회
select avg(m_price)
    from menu;
--제일 비싼 메뉴의 이름, 가격
select m_name, m_price
    from menu
    where m_price = (
        select max(m_price)
        from menu
    ); 
--최연장자 사장님 이름, 생일 조회
select o_name, o_birth
    from res_owner
    where o_birth = (
        select min(o_birth)
        from res_owner
    );
--좌석수가 제일 적은 식당 이름, 지점명, 좌석수
select r_name, r_address, r_sit
    from restaurant
    where r_sit = (
        select min(r_sit)
        from restaurant
    );
--홍콩반점 서초점을 운영하는 사람의 이름과 생일 조회
select o_name, o_birth
    from res_owner
    where ceono in (
        select r_ceono
        from restaurant
        where r_name = '홍콩반점' and r_address = '서초'
    );
--'짜장'이 들어간 음식은 어디가면 먹을 수 있나요? (식당이름, 지점)
select r_name, r_address
    from restaurant
    where r_ceono in (
        select m_ceono
        from menu
        where m_name LIKE ('%짜장%')
    );
--좌석 수 제일 많은 식당을 운영하는 사람의 모든 정보 조회
select * 
    from res_owner
    where ceono = (
        select r_ceono 
        from restaurant
        where r_sit = (
            select max(r_sit)
            from restaurant
        )
    );
--최연소 사장님네 가게 메뉴 이름, 가격
select m_name, m_price
    from menu
    where m_ceono = (
        select ceono
        from res_owner
        where o_birth = (
            select max(o_birth)
            from res_owner
        )
    );
    
--테이블 'JOIN'
--      테이블 여러개를 붙여서 RAM에 잠깐 넣어놓는
--      조건식과 함께 사용해야...
select r_name, r_address, o_name, o_birth
    from restaurant, res_owner;

--전체 식당이름, 지점명, 사장님 이름, 사장님 생일 조회
select r_name, r_address, o_name, o_birth
    from restaurant, res_owner
    where r_ceono = ceono;

--좌석수가 50개 이상인 식당의
--메뉴명, 가격, 식강이름, 지점명, 좌석수
select m_name, m_price, r_name, r_address, r_sit
    from menu, restaurant
    where m_ceono = r_ceono and r_sit >= 110;
    
--제일 큰 식당
--메뉴명, 가격, 식당이름, 지점명, 좌석수
select m_name, m_price, r_name, r_address, r_sit
    from menu, restaurant
    where m_ceono = r_ceono
    and r_sit in (
        select max(r_sit)
        from restaurant
    );

select m_name, m_price, r_name, r_address, r_sit
    from menu, restaurant;

select m_name, m_price, r_name, r_address, r_sit
    from menu, restaurant
    where m_ceono = (
        select r_ceono
        from restaurant
        where r_sit = (
            select max(r_sit)
            from restaurant
        )
    );

--전체 메뉴명, 가격, 식당이름, 지점명, 사장님이름, 생일
select m_name, m_price, r_name, r_address, o_name, o_birth
    from menu, restaurant, res_owner
    where m_ceono = r_ceono and r_ceono = ceono;
--최연장자 사장님네
--전체 메뉴명, 가격, 식당이름, 지점명, 사장님이름, 생일
--을 메뉴명 가나다순 -> 식당이름 가나다순
select m_name, m_price, r_name, r_address, o_name, o_birth
    from menu, restaurant, res_owner
    where m_ceono = r_ceono and r_ceono = ceono
    and o_birth = (
        select min(o_birth)
        from res_owner
    )
    order by m_name, r_name;
    
--메뉴 데이터를 가지고 개수를 나눠서 페이지별로
--  어떻게 될까요..?
--  메뉴 테이블 -> M_NO (PRIMARY KEY)
--      sequence로 처리
--      그런데 -> sequence는 실패해도 계속 올라감
--  만약에 실패했으면 번호가 정확히 12345가아님!

--ROWNUM (가상 필드) *** 어렵습니다!
--  select할때 마다 자동으로 부여됨
--  *랑은 같이 안됨
--  order by 보다 먼저 부여
--  무조건 1번부터 조회해야!!!

--메뉴 전체 정보 가나다 순으로 정렬
select rownum, m_name, m_price from menu;

--메뉴 이름을 가나다 순으로 정렬해서 ROWNUM 1~3 전체 정보를 조회
select rownum, m_name,m_price
    from(
        select m_name, m_price 
        from menu
        order by m_name
    )
where rownum>=1 and rownum<=3;    --무조건 1번부터 조회해야한다!

--2~4까지 메뉴테이블 전체 정보를 메뉴명 가나다 순 조회
--select문을 겉에 한번 더 씌워주면서 안에 있는 rownum(rn)이 숫자만 부여해놓고 효력을 잃어버림
select rn, m_name, m_price --여기 * 도 가능!
    from(        
        select rownum rn, m_name,m_price
            from(
                select m_name, m_price 
                from menu
                order by m_name
            )
--            where rownum>=2 and rownum<=4;
    )
where rn>=2 and rn<=4;

--길동 이름을 가진 사장님네
--메뉴명, 가격, 식당명, 지점명, 사장님 이름
--가격 내림차순->메뉴명 가나다 순 정렬
--3~8번만 조회
select *
    from(
    select rownum rn, m_name, m_price, r_name, r_address, o_name
        from(
            select m_name, m_price, r_name, r_address, o_name
                from menu, restaurant, res_owner
                where m_ceono = r_ceono and r_ceono = ceono 
                and o_name in (
                    select o_name  
                    from res_owner
                    where o_name like ('%길동')
                )
                order by m_price desc, m_name
        )
    )
where rn>=3 and rn<=8;

--3~8번만 조회
select *
    from(
        select ROWNUM RN, m_name, m_price, r_name, r_address, o_name
            from menu, restaurant, res_owner
            where m_ceono = r_ceono and r_ceono = ceono and o_name LIKE('%길동')
            order by m_price desc, m_name asc
    )
where rn>=3 and rn<=8;

--김씨 성을 가진 사장님네 메뉴명, 가격, 사장님 이름, 사장님 성별
--      가격 오름차순
--      2~3번만 조회
 select*
    from(
        select rownum rn, m_name, m_price, o_name, o_gender        
            from(
                select m_name, m_price, o_name, o_gender
                    from menu, res_owner
                    where m_ceono = ceono and o_name like ('김%')
                    order by m_price asc
            )
    )
where rn>=2 and rn<=3;
--where rn in (2,3)
--where rn between 2 and 3
