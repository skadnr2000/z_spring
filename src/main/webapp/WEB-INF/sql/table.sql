-----------------------------------------------------------------------
--������ ���̵�, ��ȣ ����� admin ���̺� ���� ������ �Է�           --
-----------------------------------------------------------------------

create table admin(
	admin_no		number		                             --������ ��ȣ
	, admin_id		varchar2(20)	not null unique      --������ ���̵�
	, pwd		varchar2(20)	not null                 --��ȣ
	, primary key(admin_no)
);
insert into admin values( 1, 'a', '123' );
insert into admin values( 2, 'x', '123' );

-----------------------------------------------------------------------
--��� ���� ����� ����� code_saup_field ���̺� ����                --
-----------------------------------------------------------------------
create table code_saup_field(
	saup_field_code	number(3)				             --����о� �ڵ��ȣ
	, saup_field_name	varchar2(20)	not null unique	 --����о߸�
	, primary key(saup_field_code)
);
insert into code_saup_field values( 1, 'IT' );
insert into code_saup_field values( 2, '���' );
insert into code_saup_field values( 3, '����' );
insert into code_saup_field values( 4, '��Ÿ' );
-----------------------------------------------------------------------
--����ó ������ ����� contact ���̺� ����                           --
-----------------------------------------------------------------------
create table contact(
	contact_no		number(5)				        --����ó ��ȣ
	, contact_name	varchar2(20)	not null		--����ó��
	, contact_img_name	varchar2(20)		--����ó�̹�����
	, phone		varchar2(20)	not null		    --����ó��ȭ
	, reg_date		date		default    sysdate	--�����
	, primary key(contact_no)
);

-----------------------------------------------------------------------
--����ó�� ����о߰� ����� contact_saup_field ���̺� ����          --
-----------------------------------------------------------------------
create table contact_saup_field (
	contact_no		number(5)				    --����ó ��ȣ
	, saup_field_code	number(3)				--����о� �ڵ��ȣ
	, foreign key(contact_no) references contact(contact_no)
	, foreign key(saup_field_code) references code_saup_field(saup_field_code)
);

