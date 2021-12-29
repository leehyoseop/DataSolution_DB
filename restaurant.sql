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