--[제약조건 중 외래키]
create table student(
	stcode varchar2(5 char) primary key,
	stname varchar2(5 char) not null,
	dpcode varchar2(5 char),
	constraint fk_dpcode foreign key(dpcode)
		references department(dpcode)
		on delete cascade
);
--웹사이트에서 게시판과 이를 참조하는 게시판 댓글 테이블을 구성
--게시판 테이블: 작성자 / 게시판 글 내용 / 작성시간
--댓글 테이블: 작성자 / 댓글내용 / 작성시간

create table board(
    b_no number(5) primary key,
    b_writer varchar2(10 char) not null,
    b_content varchar2(50 char) not null,
    b_time date not null
);
create sequence board_seq;
drop table board cascade constraint;
insert into board values(board_seq.nextval, '이효섭', '오늘은 12월 30일', sysdate);
insert into board values(board_seq.nextval, '김효섭', '내일은 12월 31일', sysdate);
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
insert into boardcomment values(boardcomment_seq.nextval, '김아무개', '곧 새해!', sysdate, 1);
insert into boardcomment values(boardcomment_seq.nextval, '이아무개', '연말송년회!', sysdate, 2);
insert into boardcomment values(boardcomment_seq.nextval, '토르', '내일 영화봐야지', sysdate, 2);
insert into boardcomment values(boardcomment_seq.nextval, '스파이더맨', '재밌나!', sysdate, 1);

select * from boardcomment;
delete from board where b_no = 1;