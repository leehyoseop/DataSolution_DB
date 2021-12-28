--[�ɼ�]
--��������(Constraint) �̶�� �θ�
--������ ���Ἲ�� �����ϱ� ���ؼ� ���
--		������ ���Ἲ : �����ͺ��̽��� ����� �������� �ϰ���, ��Ȯ���� ��Ű�� ��
--	1.������ ���Ἲ ��������
--		������ ����(Domain Constraint)�̶�� �ϸ�,
--		�����̼� ���� Ʃ�õ��� �����ο� ������ ���� ������ �Ѵٴ� ����
--		�ڷ���(type), ��(null/not null), �⺻��(default), üũ(check)
--	2.��ü ���Ἲ ��������
--		�⺻Ű �����̶����
--		�����̼��� �⺻Ű�� �����ϰ�, NULL���� �������� �ȵǸ�,
--		�����̼� ���� ���� �ϳ��� ���� �����ؾ� �Ѵٴ� ����
--	3.���� ���Ἲ ��������
--		�ܷ�Ű �����̶����
--		�����޴� �����̼��� �ܷ�Ű�� �����ϴ� �����̼��� �⺻Ű�� �������� �����ؾ��ϸ�,
--		�����޴� �����̼��� ���� ����ɶ�, �����ϴ� �����̼��� ������ �޴´�.

--> not null / primary key /foreign key

--1. NOT NULL : (null�� ���� ����ִ� / 0�� �ƴϰ� ���⵵ �ƴ� ���� ���� ���� ���� ����)
--		NULL�� ������� �ʴ´� -> �ʼ������� ���� �־����! (���� ���� ��� O)

create table example(
	col1 varchar2(10 char),
	col2 varchar2(10 char) not null
);
create table example(
	col1 varchar2(10 char),
	col2 varchar2(10 char)
	constraint col2_notnull not null
);
select * from example;

--2. Unique	: �ش� �÷��� ���� ���� ���̺� ��ü���� �����ؾ� �Ѵ�!�� �ǹ�
--	Not null�� �Բ� ����� ����������, unqiue�� �� ������ ����

create table example(
	col1 varchar2(10 char) unique,
	col2 varchar2(10 char) unique not null,
	col3 varchar2(10 char)
	constraint col3_unique unique(col3)
);

--3. Primary key(�⺻ Ű) : Null���� ������� �ʰ�, �ߺ��� �����͸� ������� ����. 
--	(not null + unique = primary key)
--	������ Ư�� ������ �˻��ϰų�, �������� �۾��� �Ҷ� �⺻Ű�� �����Ѵ�.
--	ex) ID, �ֹε�Ϲ�ȣ, ȸ����ȣ, �� ��ȣ, ...
--	�������̸� �� ���̺�� PK�� �ϳ�������..!

create table example4(
	col1 varchar2(10 char) primary key,
	col2 varchar2(10 char),
	col3 varchar2(10 char)
);

/*PK�� 2�� �̻� ����ϴ� ��� constraint Ű���� ��� + PK�� �������̸� �ϳ�������..*/
create table exmple5(
	col1 varchar2(10 char),
	col2 varchar2(10 char),
	col3 varchar2(10 char)
	constraint pk_example5 primary key(col1, col2)
);

--4. foreign key(�ܷ� Ű) : �ٸ� ���̺��� Ư�� �÷��� ��ȸ�ؼ�
--						������ �����Ͱ� �ִ� ��쿡�� �Է�, ����,...����
--	�����ϴ� ���̺��� PK�� unique�� ������ �÷����� FK�� ������ �� �ִ�!
--	�ܷ�Ű ������ ���ؼ��� �����޴� �÷��� ���� �����Ǿ���ϰ�, �ܷ�Ű�� ���� ���̺��� ���Ŀ� �����Ǿ����

create table example6(
	col1 varchar2(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');

select*from EXAMPLE6;
-- �ܷ�Ű ���̺� ����
--create table ���̺��(
--  �÷��� �ڷ���,
--   constraint FK�� foreign key(�÷���)
--     references ������̺��(������̺��� �⺻Ű( OR ����Ű) �÷���)
--      [on delete set null || on delete cascade] -- (���� �ɼ��̾�)
      -- �����ϴ� ���̺��� �� �κ��� ������ ��,
      -- �� ���̺��� ����Ǿ� �ִ� �࿡ ���ؼ� null���� ������
      -- �ƴϸ� ���� �������� ���� �ɼ�
);

create table example6(
   col1 varchar2(10 char) primary key
);
insert into example6 values('10');
insert into example6 values('20');
insert into example6 values('30');
select * from EXAMPLE6;

create table example7(
   col1 varchar2(10 char),
   constraint fk_col1 foreign key(col1)
      references EXAMPLE6(col1)
      on delete cascade
);
insert into example7 values('10');
insert into example7 values('20');
insert into example7 values('30');
insert into example7 values('40'); -- example6���� 40�̶�� ���� �����Ƿ� �ܷ�Ű�� ������ �ʴ� ��Ȳ!
select * from example7;
-- example6�� '10'�� ���� ����� ��� �ɱ�?
delete from example6 where col1 = '10'; -- examle7�� '10'�� ���� �ܷ�Ű �ȸ����� ��Ȳ ��!

create table department(
	dpcode varchar2(5 char) primary key,
	dpname varchar2(5 char)	
);
--drop table department;
create table student(
	stcode varchar2(5 char) primary key,
	stname varchar2(5 char) not null,
	dpcode varchar2(5 char),
	constraint fk_dpcode foreign key(dpcode)
		references department(dpcode)
		on delete cascade
);

insert into department values('123', 'ȭ�а��а�');
insert into department values('456', '�ǻ��а�');
insert into department values('789', '�ǿ����ǰ�');
select * from DEPARTMENT;
insert into student values('1111', '��ȿ��', '123');
insert into student values('2222', '��ȿ��', '123');
insert into student values('3333', '��ȿ��', '456');
insert into student values('4444', '��ȿ��', '789');
select * from student;
delete from DEPARTMENT where dpcode = '123';

--5. check : �������� ���� ������ ������ �����Ͽ� ���ǿ� �ش��ϴ� �����͸� ����Ѵ�.
CREATE TABLE example8(
	col1 number(10)
	constraint
);

--6. default : �ƹ��� �����͸� �Է����� �ʾ��� ���, ������ �����Ͱ� �ڵ����� �Էµ�.
create table example9(
	col number(3) default 999 not null
);

insert into example9 values(default);
insert into example9 values(null);
insert into example9 values(0);
insert into example9 values(11);
insert into example9 values('');
select*from example9;

CREATE TABLE coffee_menu(
name varchar2(10 char) PRIMARY KEY,
price number(7) not null,
cal number(4,1) not null,
start_date date not null,
)

--DDL - Alter, Drop (���� ����)
--������ Ÿ�� ���� / �÷��� ũ�� ����
--alter table [���̺��] modify [�÷���] [������Ÿ��(�뷮)];
-- ���� �ִ� ���¿��� ������Ÿ�� �����ϸ� ����!
alter table coffee_menu modify name number(3);
--���� �ִ� ���¿��� �뷮�� ���� �����ϸ� ����!
alter table coffee_menu modify name varchar2(2 char);

--�÷��� ����
--alter table [���̺��] rename column [���� �÷���] to [���ο� �÷���];
--alter table coffe_menu rename column c_name to c_name2;
--alter table [���̺��] add [�÷���] [������Ÿ��(�뷮)] [��������(��������)];
--alter table coffee_menu add taste varchar2(10 char) not null;

--�÷� ����
--alter table[���̺��] drop column [�÷���];
alter table coffee_menu drop column taste;

--drop
--���̺��� ����! (�����뿡 �ֱ�)
--drop table [���̺��] cascade constraint;

--�����뿡 �ִ� ���̺� ����
--flashback table [���̺��] to before drop;
--������ ����
purge recyclebin;
