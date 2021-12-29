--***��������
--select�� �ȿ��� �ٽ� select���� ����ϴ� ���
--�ϳ��� sql�� �ȿ��� �ٸ� sql���� ��ø�Ǵ� ���ǹ�
--���� �����Ͱ� �뷮�϶� �����͸� ��� ���ļ� �����ϴ� join���� 
--�ʿ��� �����͸� ã�Ƽ� �������ִ� subquery�� ������ �� ����.

--������(main query)�� �μ�����(subquery)�� ������
select s_name, s_price
    from snack
    where s_price < (
        select avg(s_price)
        from snack
    );
    
--�ְ�
select max(s_price) from snack; 
--���� ��� ������ �̸�, ������, ����
select distinct s_name, s_company, s_price 
    from snack 
    where s_price = (
        select max(s_price)
        from snack
    );
--���� �� ���ڴ� ��� ������� ��ȸ
select s_company 
    from snack 
    where s_price = (
        select min(s_price)
        from snack
    );
--��հ����� ��� ���ڴ� �����
select count(s_no)
    from snack
    where s_price > (
        select avg(s_price)
        from snack
    );
--��������� ���� �������� ������ ��ü ����
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
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, 'ũ���', '�̱� �ν���������',400);
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, '����', 'ĳ���� �����',300);
insert into snackco(co_no, co_name, co_address, co_people) values (co_seq.nextval, '���', '���� �ĸ�',200);
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
    
--���� ��� ���ڸ� ����� ȸ��� ����ִ��� ��ȸ
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
--���￡ �ִ� ȸ�翡�� ����� ���� ��հ� ��ȸ
select avg(s_price)
    from snack
    where s_company = (
        select co_name
            from snackco
            where co_address = '���� �ĸ�'
    );
--��հ� �̻��� ���ڸ� ����� ȸ���̸�, ��ġ
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