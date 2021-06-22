package vo;

public class EvReviewVo {
	
	private int hidx;
	private String hName;
	private String hdate;
	private String henddate;
	private String hcata;
	private String hprice;
	private String htarget;
	private String hloca;
	private String hpeople;
	private String htext;
	private String himg;
	private int hdelYn;
	
	public int getHidx() {
		return hidx;
	}
	public void setHidx(int hidx) {
		this.hidx = hidx;
	}
	public String gethName() {
		return hName;
	}
	public void sethName(String hName) {
		this.hName = hName;
	}
	public String getHdate() {
		return hdate;
	}
	public String getstartdate() {
		String date =  getHdate();
		String startdate = date.substring(0,10);
		return startdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getHenddate() {
		return henddate;
	}
	public String getendenddate() {
		String date =  getHenddate();
		String enddate = date.substring(0,10);
		return enddate;
	}
	public void setHenddate(String henddate) {
		this.henddate = henddate;
	}
	public String getHcata() {
		return hcata;
	}
	public void setHcata(String hcata) {
		this.hcata = hcata;
	}
	public String getHprice() {
		return hprice;
	}
	public void setHprice(String hprice) {
		this.hprice = hprice;
	}
	public String getHtarget() {
		return htarget;
	}
	public void setHtarget(String htarget) {
		this.htarget = htarget;
	}
	public String getHloca() {
		return hloca;
	}
	public void setHloca(String hloca) {
		this.hloca = hloca;
	}
	public String getHpeople() {
		return hpeople;
	}
	public void setHpeople(String hpeople) {
		this.hpeople = hpeople;
	}
	public String getHtext() {
		return htext;
	}
	public void setHtext(String htext) {
		this.htext = htext;
	}
	public String getHimg() {
		return himg;
	}
	public void setHimg(String himg) {
		this.himg = himg;
	}
	public int getHdelYn() {
		return hdelYn;
	}
	public void setHdelYn(int hdelYn) {
		this.hdelYn = hdelYn;
	}
	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	private int gidx;
	
}
