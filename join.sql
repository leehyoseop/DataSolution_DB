--join
--  �ϳ��� ��ɹ��� ���� ���� ���̺� ����� �����͸� �ѹ��� ��ȸ�� �� �ִ� ���
--  ��ġ �ϳ��� ���̺��ΰ�ó�� �����ִ� ��.

create table tr1(name varchar2(20 char), age number(3));
create table tr2(name varchar2(20 char), age number(3));
drop table tr2;

insert into tr1 values('����', 30);
insert into tr1 values('�ں��', 35);
insert into tr1 values('�ֺ��', 40);
insert into tr1 values('�����', 45);

insert into tr2 values('����', 30);
insert into tr2 values('�̺��', 50);
insert into tr2 values('�����', 55);

--cross join : ������ ���� ���� �� ���̺��� ������ ��~~�� ����� ��ȸ(��� ����� ��)
--��ǻ� �Ⱦ��� ����
select * from tr1, tr2;
select * from tr1 cross join tr2;
--inner join : ���ǿ� �ش��ϴ� ���� ����
select * from tr1 inner join tr2 on tr1.name = tr2.name;
select * from tr1 a, tr2 b where a.name = b.name; -- equi ����(���� ����)
select * from tr1 join tr2 using(name); --equi���� ~ using(���δ�� Į����)
select * from tr1 natural join tr2; --�ڿ�����, ������ ���� ���ʿ� ���� �̸��� ���� ������ �÷����� ��ȸ

--outer join : ���� ���̺��� �����Ͱ� ��� ��ȸ �ǰ�,
                ��� ���̺� �����Ͱ� ���� ��쿡 �ش� �÷��� ���� �������� ���ؼ�!

--(+)�� �̿��� outer join : null�� ��µǴ� ���̺��� �÷��� (+)��ȣ �߰�

--left outer join : �������̺� ���� ���� �� ������ ���̺������ǿ� ���� �ʾƵ� ���� ����(���ǿ� ���� ������ null)
select * from tr1 left outer join tr2 on tr1.name = tr2.name;
select * from tr1, tr2 where tr1.name = tr2.name(+);
--right outer join : ���������̺� ���� ���� �� ���� ���̺������ǿ� ���� �ʾƵ� ���� ����(���ǿ� ���� ������ null)
--full outer join : �������̺� ���� ���� �� �ٸ��� ���̺��� ���ǿ� �����ʾƵ� ���� ����
select * from tr1 full outer join tr2 on tr1.name = tr2.name;

--self join **�򰥸�
--�ϳ��� ���̺��� �ִ� �÷����� �����ϴ� ������ �ʿ��� ���
--�ܾ� ���� ������ join�Ѵ�
create table member(
    m_id varchar2(10 char) primary key,
    m_name varchar2(10 char) not null,
    m_manager varchar2(10 char) 
);
insert into member values('member1', 'ȸ��1', 'manager1');
insert into member values('member2', 'ȸ��2', 'manager1');
insert into member values('member3', 'ȸ��3', 'manager1');
insert into member values('member4', 'ȸ��4', 'manager2');
insert into member values('member5', 'ȸ��5', 'manager2');
insert into member values('manager1', '������1', 'null');
insert into member values('manager2', '������1', 'null');

select * from member; 

--�� ���̺� ������ �� �����ڰ� � ȸ���� �����ϴ��� �˰� ����
select m_id, m_name, m_manager from member
    where m_manager in (select m_id from member);
    
select * from member a join member b
    on a.m_id = b.m_id;

select a.m_id, a.m_name, b.m_id "member_id"
    from member a join member b --���� ���̺������� ���������� �ϱ����ؼ� ���̺� ���� ��Ī�� �־���!
    on a.m_id = b.m_manager; --����id�� ������ ������ ���� ������ �����ؼ� �����ڰ� �����ϴ� ȸ���� id���� �����ü� �ְ� ����


