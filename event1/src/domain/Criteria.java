package domain;

public class Criteria {
	
	private int page;		 //페이지 번호
	private int perPageNum;  //리스트에 보여주는 개수
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 15;		
	}	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

}
