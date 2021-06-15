package domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	boolean prev;
	boolean next;
	private int displayPageNum = 10;
	private SearchCriteria scri;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	//	System.out.println("calcData����");
		calcData();	
	//	System.out.println("calcData����");
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	
	
	public void calcData(){
		System.out.println("������"+scri.getPage());
		
		//�׺���̼��� ��������
		endPage = (int) (Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);
		//�׺���̼��� ���� ������
		startPage = (endPage - displayPageNum)+1;
	//	System.out.println("endPage"+endPage);
	//	System.out.println("startPage"+startPage);
		
		//�ӽó�������
		int tempEndPage = (int) (Math.ceil(totalCount/(double) scri.getPerPageNum()));
		
		if(endPage>tempEndPage) {
			endPage = tempEndPage;
		}			
		//���� ���� ��ư
		prev = startPage == 1 ? false : true;		
		next = endPage * scri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String encoding(String keyword){
		
		if(keyword==null || keyword.trim().length()==0){
			return "";
		}		
		try{
			return URLEncoder.encode(keyword, "UTF-8");
		}catch(UnsupportedEncodingException e){
			return "";			
		}
	}
	
}
