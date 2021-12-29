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