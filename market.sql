create table market(
    m_no number(4) primary key,
    m_name varchar2(10 char) not null,
    m_location varchar2(10 char) not null,
    m_land number(4) not null,
    m_parking number(4) not null
);

create SEQUENCE market_seq;

insert into market values(market_seq.nextval, 'Ȩ�÷���', '����', 1000, 500);
insert into market values(market_seq.nextval, 'Ȩ�÷���', '��õ', 500, 300);
insert into market values(market_seq.nextval, '�̸�Ʈ', '����', 800, 800);

create table product(
    p_no number(4) primary key,
    p_name varchar2(10 char) not null,
    p_weight number(4) not null,
    p_price number(5) not null,
    p_m_no number(4) not null,
    constraint fk_p_m_no foreign key(p_m_no)
    references market(m_no)
    on delete cascade
);

create SEQUENCE product_seq;
insert into product values(product_seq.nextval, '����', 3000, 10000,1);
insert into product values(product_seq.nextval, '��', 500, 5000, 2);
insert into product values(product_seq.nextval, '����', 2000, 5000, 3);
select * from product;
--UPDATE [���̺��]
--set �ʵ�� -��, �ʵ�� -��, ...�ٲܳ���
--where ����;
--Ȩ�÷��� ��õ���� ��ǰ���� 10% ����
update product 
set p_price = p_price * 0.9
    where p_m_no in (
        select m_no
        from market
        where m_name = 'Ȩ�÷���' and m_location ='��õ'
    ); 
--���� ��Ѱ� 10% ����
update product 
set p_price = p_price * 0.9
    where p_price = (
        select max(p_price)
        from product
        --where m_name = 'Ȩ�÷���' and m_location ='��õ'
    ); 
DELETE from [���̺��]
where ���ǽ�;
--���� ���� ���� ��ǰ �� ����
delete from product
where p_m_no in (
    select m_no
    from market
    where market.m_land in (
        select min(m_land)
        from market
    )
);