--[�������� �� �ܷ�Ű]
create table student(
	stcode varchar2(5 char) primary key,
	stname varchar2(5 char) not null,
	dpcode varchar2(5 char),
	constraint fk_dpcode foreign key(dpcode)
		references department(dpcode)
		on delete cascade
);
--������Ʈ���� �Խ��ǰ� �̸� �����ϴ� �Խ��� ��� ���̺��� ����
--�Խ��� ���̺�: �ۼ��� / �Խ��� �� ���� / �ۼ��ð�
--��� ���̺�: �ۼ��� / ��۳��� / �ۼ��ð�

create table board(
    b_no number(5) primary key,
    b_writer varchar2(10 char) not null,
    b_content varchar2(50 char) not null,
    b_time date not null
);
create sequence board_seq;
drop table board cascade constraint;
insert into board values(board_seq.nextval, '��ȿ��', '������ 12�� 30��', sysdate);
insert into board values(board_seq.nextval, '��ȿ��', '������ 12�� 31��', sysdate);
select * from board;

create table boardcomment(
    c_no number(5) primary key,
    c_writer varchar2(10 char) not null,
    c_content varchar2(30 char) not null,
    c_time date not null,
    b_no number(5), 
    constraint fk_b_no foreign key(b_no)
        references board(b_no)
        on delete cascade
);
drop table boardcomment cascade constraint;
create sequence boardcomment_seq;
insert into boardcomment values(boardcomment_seq.nextval, '��ƹ���', '�� ����!', sysdate, 1);
insert into boardcomment values(boardcomment_seq.nextval, '�̾ƹ���', '�����۳�ȸ!', sysdate, 2);
insert into boardcomment values(boardcomment_seq.nextval, '�丣', '���� ��ȭ������', sysdate, 2);
insert into boardcomment values(boardcomment_seq.nextval, '�����̴���', '��ճ�!', sysdate, 1);

select * from boardcomment;
delete from board where b_no = 1;