package com.naver.erp;

//************************************************************************
public class PageingData {
//************************************************************************
	public int totRowCnt;         // [총 검색 행의 개수] 저장 변수 선언
	public int selectPageNo;      // [선택된 페이지 번호] 저장 변수 선언

	public int lastPageNo;        // 총 마지막 페이지 번호 저장 변수 선언
	public int beginPageNo;       // 선택 페이지에서 보이는 [시작 페이지 번호] 호
	public int endPageNo;         // 선택 페이지에서 보이는 [끝 페이지 번호] 저장 변수 선언
	//---
	public int beginRowNo;        // 선택 페이지에서 보이는 [시작 행의 검색 목록 상 순서 번호] 저장 변수 선언
	public int endRowNo;          // 선택 페이지에서 보이는 [끝 행의 검색 목록 상 순서 번호] 저장 변수 선언
	public int beginRowNo_desc;   // 페이지에서 보이는 [시작 행의 검색 목록 상 역순 순서 번호] 저장 변수 선언
	//--------------------------------------------------
	public PageingData(
		int totRowCnt
		, int selectPageNo
		, int rowCntPerPage
		, int pageNoCntPerPage
	) {
		if( totRowCnt>0 && selectPageNo>0 && rowCntPerPage>0 && pageNoCntPerPage>0 ) { 
			this.totRowCnt = totRowCnt;
			//-------------------------------
			// 마지막 페이지 번호 얻기. <주의>반드시 상단에 먼저 나와야함
			//-------------------------------
			this.lastPageNo = totRowCnt/rowCntPerPage  +  (totRowCnt%rowCntPerPage>0?1:0);
				// 만약 [선택 페이지 번호]와 [총 행의 개수]의 관계가 이상하면 [선택 페이지 번호]를 1로 초기화 하기
				// <예>페이지당 보이는 행의 개수가 10개 일때, 선택 페이지 번호가 3 인데 총 개수가 3일 경우
				if( this.lastPageNo<selectPageNo ) { selectPageNo = 1; }
			this.selectPageNo = selectPageNo;
			//-------------------------------
			// 선택 페이지에서 보이는 시작 페이지 번호 얻기
			//-------------------------------
			this.beginPageNo = (selectPageNo/pageNoCntPerPage + (selectPageNo%pageNoCntPerPage>0?1:0) ) * pageNoCntPerPage - pageNoCntPerPage + 1;
			//-------------------------------
			// 선택 페이지에서 보이는 끝 페이지 번호 얻기
			//-------------------------------
			this.endPageNo = (selectPageNo/pageNoCntPerPage + (selectPageNo%pageNoCntPerPage>0?1:0) ) * pageNoCntPerPage;
				// 만약 [끝 페이지 번호] > [마지막 페이지 번호]  경우 [끝 페이지 번호]를 [마지막 페이지 번호]로 바꾸기
				if( this.endPageNo>this.lastPageNo ) { this.endPageNo = this.lastPageNo; }

			//-------------------------------
			// 선택 페이지에서 보이는 시작 행의 검색 목록 상 [순서 번호] 얻기
			//-------------------------------
			this.beginRowNo = (selectPageNo * rowCntPerPage) - (rowCntPerPage) + 1;
			//-------------------------------
			// 선택 페이지에서 보이는 끝 행의 검색 목록 상 순서 번호 얻기. 
			//-------------------------------
			this.endRowNo = (selectPageNo * rowCntPerPage);
				// 만약 [총 행의 개수] < [마지막 행의 순서번호]  경우 [마지막 행의 순서번호]를 [총 행의 개수]로 바꾸기
				if( this.endRowNo>totRowCnt ) {  this.endRowNo = totRowCnt;  }
			//-------------------------------
			// 선택 페이지에서 보이는 시작 행의 검색 목록 상 [역순 순서 번호] 얻기
			//-------------------------------
			this.beginRowNo_desc = totRowCnt - this.beginRowNo + 1;

		}
	}		
	//--------------------------------------------------
/*	
	public static void main(String[] args) {
		SearchPageData xxx = new SearchPageData( 
				119 	// totRowCnt
				, 44	// selectPageNo
				, 10	// rowCntPerPage
				, 10 	// pageNoCnPerPage
		);
		System.out.println( "----------------------" );
		System.out.println( "totRowCnt => " + xxx.totRowCnt );
		System.out.println( "----------------------" );
		System.out.println( "beginRowNo => " + xxx.beginRowNo );
		System.out.println( "endRowNo => " + xxx.endRowNo );
		System.out.println( "beginRowNo_asc => " + xxx.beginRowNo_desc );
		System.out.println( "----------------------" );
		System.out.println( "lastPageNo => " + xxx.lastPageNo ); 
		System.out.println( "beginPageNo => " + xxx.beginPageNo );
		System.out.println( "endPageNo => " + xxx.endPageNo ); 
		
	}
*/
//************************************************************************
}
//************************************************************************





//public int selectPageNo;      // 선택 페이지 번호
//public int rowCntPerPag;      // 페이지 당 보이는 행의 개수
//public int pageNoCnPerPage;   // 페이지 당 보이는 페이지 번호 개수
//public int totRowCnt;         // 총 행의 개수
//---
//public int beginPrintNo_asc;  // 선택 페이지에서 보이는 시작 행의 검색 목록 상 순서 번호          // 선택 페이지에서 보이는 시작 행의 오름 순서 시작 출력 번호
//public int beginPrintNo_desc; // 선택 페이지에서 보이는 시작 행의 검색 목록 상 역순 순서 번호          // 선택 페이지에서 보이는 시작 행의 내름 순서 시작 출력 번호
//---
//this.beginPrintNo_asc = this.beginRowNo;
//this.beginPrintNo_desc = totRowCnt - this.beginPrintNo_asc + 1;
//this.beginRowNo_desc = totRowCnt - this.beginRowNo + 1;