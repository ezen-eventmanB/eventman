package domain;

public class SearchCriteria extends Criteria {
	
	private String keyword;    //�˻���
	private String searchType; //�˻�Ÿ��
	
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
