--��ľ� ����������
--ȫ����� �������� ȫ�浿�� � 100��
--ȫ����� ��õ���� ��浿�� � 80��
--�ѽ����� �������� ȫ�浿�� � 150��
--�������� �������� �ֱ浿�� � 130��

--ȫ�浿, 1950-03-01�ϻ� ,����
--��浿, 1992-02-01�ϻ� ,����
--ȫ�浿, 1991-12-12�ϻ� ,����
--�ֱ浿, 1989-07-14�ϻ� ,����

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

insert into restaurant values(11,'ȫ�����', '����', 'ȫ�浿', 100);
insert into restaurant values(22,'ȫ�����', '��õ', '��浿', 80);
insert into restaurant values(33,'�ѽ�����', '����', 'ȫ�浿', 150);
insert into restaurant values(44,'��������', '����', '�ֱ浿', 130);

insert into res_owner values(11,'ȫ�浿', to_date('1950-03-01', 'YYYY-MM-DD'), '����');
insert into res_owner values(22,'��浿', to_date('1992-02-01', 'YYYY-MM-DD'), '����');
insert into res_owner values(33,'ȫ�浿', to_date('1991-12-12', 'YYYY-MM-DD'), '����');
insert into res_owner values(44,'�ֱ浿', to_date('1989-07-14', 'YYYY-MM-DD'), '����');

select * from restaurant;
select * from res_owner;
drop table restaurant;
drop table res_owner;

--�¼� �� ���� ���� �Ĵ� ��ϴ� ��� ������ ���� ��ȸ
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

--�޴���ȣ / �޴� �̸� / �޴� ���� / �޴� �Ĵ� �Ĵ� ��ȣ
create table menu(
    m_num number(3),
    m_name varchar2(10 char),
    m_price number(5),
    m_ceono number(4)
);
insert into menu values(99,'¥���', 5500,11);
insert into menu values(98,'«��', 5500,11);
insert into menu values(97,'������ä', 9500,11);
insert into menu values(96,'��ٷο�', 13000,11);
insert into menu values(95,'��¥���', 6000,11);
insert into menu values(94,'��õ¥��', 8000,22);
insert into menu values(93,'���', 7000,22);
insert into menu values(92,'������', 15000,22);
insert into menu values(91,'�ຸ��', 30000,22);
insert into menu values(90,'¥���', 6000,22);
insert into menu values(89,'�����', 3000,33);
insert into menu values(88,'����', 4000,33);
insert into menu values(87,'�߹�', 5000,33);
insert into menu values(86,'��¡���', 1000,33);
insert into menu values(85,'������', 16000,33);
insert into menu values(84,'ī�����̽�', 10000,44);
insert into menu values(83,'����������', 9500,44);
insert into menu values(82,'����ȸ', 6900,44);
insert into menu values(81,'������', 8900,44);
insert into menu values(90,'����', 9900,44);

select * from menu;

--���������� �޴� ��ü�̸�, ����
--  �� �������� -> �޴��� ������ ���� ��ȸ
select m_name, m_price
    from menu
    order by m_price asc, m_name desc;
-- ��ü ����Ե� �̸�, ���� ��ȸ
select o_name, o_birth
    from res_owner;
--���������� �Ĵ��� �� �� ��ȸ
select count(*)
    from restaurant;
--���������� �޴� ��ü�� ��հ� ��ȸ
select avg(m_price)
    from menu;
--���� ��� �޴��� �̸�, ����
select m_name, m_price
    from menu
    where m_price = (
        select max(m_price)
        from menu
    ); 
--�ֿ����� ����� �̸�, ���� ��ȸ
select o_name, o_birth
    from res_owner
    where o_birth = (
        select min(o_birth)
        from res_owner
    );
--�¼����� ���� ���� �Ĵ� �̸�, ������, �¼���
select r_name, r_address, r_sit
    from restaurant
    where r_sit = (
        select min(r_sit)
        from restaurant
    );
--ȫ����� �������� ��ϴ� ����� �̸��� ���� ��ȸ
select o_name, o_birth
    from res_owner
    where ceono in (
        select r_ceono
        from restaurant
        where r_name = 'ȫ�����' and r_address = '����'
    );
--'¥��'�� �� ������ ��𰡸� ���� �� �ֳ���? (�Ĵ��̸�, ����)
select r_name, r_address
    from restaurant
    where r_ceono in (
        select m_ceono
        from menu
        where m_name LIKE ('%¥��%')
    );
--�¼� �� ���� ���� �Ĵ��� ��ϴ� ����� ��� ���� ��ȸ
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
--�ֿ��� ����Գ� ���� �޴� �̸�, ����
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
    
--���̺� 'JOIN'
--      ���̺� �������� �ٿ��� RAM�� ��� �־����
--      ���ǽİ� �Բ� ����ؾ�...
select r_name, r_address, o_name, o_birth
    from restaurant, res_owner;

--��ü �Ĵ��̸�, ������, ����� �̸�, ����� ���� ��ȸ
select r_name, r_address, o_name, o_birth
    from restaurant, res_owner
    where r_ceono = ceono;

--�¼����� 50�� �̻��� �Ĵ���
--�޴���, ����, �İ��̸�, ������, �¼���
select m_name, m_price, r_name, r_address, r_sit
    from menu, restaurant
    where m_ceono = r_ceono and r_sit >= 110;
    
--���� ū �Ĵ�
--�޴���, ����, �Ĵ��̸�, ������, �¼���
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

--��ü �޴���, ����, �Ĵ��̸�, ������, ������̸�, ����
select m_name, m_price, r_name, r_address, o_name, o_birth
    from menu, restaurant, res_owner
    where m_ceono = r_ceono and r_ceono = ceono;
--�ֿ����� ����Գ�
--��ü �޴���, ����, �Ĵ��̸�, ������, ������̸�, ����
--�� �޴��� �����ټ� -> �Ĵ��̸� �����ټ�
select m_name, m_price, r_name, r_address, o_name, o_birth
    from menu, restaurant, res_owner
    where m_ceono = r_ceono and r_ceono = ceono
    and o_birth = (
        select min(o_birth)
        from res_owner
    )
    order by m_name, r_name;
    
--�޴� �����͸� ������ ������ ������ ����������
--  ��� �ɱ��..?
--  �޴� ���̺� -> M_NO (PRIMARY KEY)
--      sequence�� ó��
--      �׷��� -> sequence�� �����ص� ��� �ö�
--  ���࿡ ���������� ��ȣ�� ��Ȯ�� 12345���ƴ�!

--ROWNUM (���� �ʵ�) *** ��ƽ��ϴ�!
--  select�Ҷ� ���� �ڵ����� �ο���
--  *���� ���� �ȵ�
--  order by ���� ���� �ο�
--  ������ 1������ ��ȸ�ؾ�!!!

--�޴� ��ü ���� ������ ������ ����
select rownum, m_name, m_price from menu;

--�޴� �̸��� ������ ������ �����ؼ� ROWNUM 1~3 ��ü ������ ��ȸ
select rownum, m_name,m_price
    from(
        select m_name, m_price 
        from menu
        order by m_name
    )
where rownum>=1 and rownum<=3;    --������ 1������ ��ȸ�ؾ��Ѵ�!

--2~4���� �޴����̺� ��ü ������ �޴��� ������ �� ��ȸ
--select���� �ѿ� �ѹ� �� �����ָ鼭 �ȿ� �ִ� rownum(rn)�� ���ڸ� �ο��س��� ȿ���� �Ҿ����
select rn, m_name, m_price --���� * �� ����!
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

--�浿 �̸��� ���� ����Գ�
--�޴���, ����, �Ĵ��, ������, ����� �̸�
--���� ��������->�޴��� ������ �� ����
--3~8���� ��ȸ
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
                    where o_name like ('%�浿')
                )
                order by m_price desc, m_name
        )
    )
where rn>=3 and rn<=8;

--3~8���� ��ȸ
select *
    from(
        select ROWNUM RN, m_name, m_price, r_name, r_address, o_name
            from menu, restaurant, res_owner
            where m_ceono = r_ceono and r_ceono = ceono and o_name LIKE('%�浿')
            order by m_price desc, m_name asc
    )
where rn>=3 and rn<=8;

--�达 ���� ���� ����Գ� �޴���, ����, ����� �̸�, ����� ����
--      ���� ��������
--      2~3���� ��ȸ
 select*
    from(
        select rownum rn, m_name, m_price, o_name, o_gender        
            from(
                select m_name, m_price, o_name, o_gender
                    from menu, res_owner
                    where m_ceono = ceono and o_name like ('��%')
                    order by m_price asc
            )
    )
where rn>=2 and rn<=3;
--where rn in (2,3)
--where rn between 2 and 3
