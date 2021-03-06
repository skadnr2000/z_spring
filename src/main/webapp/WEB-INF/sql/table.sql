-----------------------------------------------------------------------
--관리자 아이디, 암호 저장된 admin 테이블 생성 데이터 입력           --
-----------------------------------------------------------------------

create table admin(
	admin_no		number		                             --관리자 번호
	, admin_id		varchar2(20)	not null unique      --관리자 아이디
	, pwd		varchar2(20)	not null                 --암호
	, primary key(admin_no)
);
insert into admin values( 1, 'a', '123' );
insert into admin values( 2, 'x', '123' );

-----------------------------------------------------------------------
--사업 영역 목록이 저장된 code_saup_field 테이블 생성                --
-----------------------------------------------------------------------
create table code_saup_field(
	saup_field_code	number(3)				             --사업분야 코드번호
	, saup_field_name	varchar2(20)	not null unique	 --사업분야명
	, primary key(saup_field_code)
);
insert into code_saup_field values( 1, 'IT' );
insert into code_saup_field values( 2, '통신' );
insert into code_saup_field values( 3, '금융' );
insert into code_saup_field values( 4, '기타' );
-----------------------------------------------------------------------
--연락처 정보가 저장된 contact 테이블 생성                           --
-----------------------------------------------------------------------
create table contact(
	contact_no		number(5)				        --연락처 번호
	, contact_name	varchar2(20)	not null		--연락처명
	, contact_img_name	varchar2(20)		--연락처이미지명
	, phone		varchar2(20)	not null		    --연락처전화
	, reg_date		date		default    sysdate	--등록일
	, primary key(contact_no)
);

-----------------------------------------------------------------------
--연락처의 사업분야가 저장된 contact_saup_field 테이블 생성          --
-----------------------------------------------------------------------
create table contact_saup_field (
	contact_no		number(5)				    --연락처 번호
	, saup_field_code	number(3)				--사업분야 코드번호
	, foreign key(contact_no) references contact(contact_no)
	, foreign key(saup_field_code) references code_saup_field(saup_field_code)
);

