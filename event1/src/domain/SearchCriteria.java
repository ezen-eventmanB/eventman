package domain;

public class SearchCriteria extends Criteria {
	
	private String keyword;    //검색어
	private String searchType; //검색타입
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	

}
