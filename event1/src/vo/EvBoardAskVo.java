package vo;

public class EvBoardAskVo {
	
	private int bidx;
	private String bcata;
	private String bmenu;
	private String btitle;
	private String bcontents;
	private String bfile;
	private String bwriteday;
	private String bname;
	private String bcount; 
	private String bdelyn;
	private String gName;
	private int midx;
	private int gidx;
	private int originbidx;
	private String Bcondition;
	private String Breply;
	private String bmid;
	 
	
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	public String getBcondition() {
		return Bcondition;
	}
	public void setBcondition(String bcondition) {
		Bcondition = bcondition;
	}
	public String getBreply() {
		return Breply;
	}
	public void setBreply(String breply) {
		Breply = breply;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	private int depth;
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getBcata() {
		return bcata;
	}
	public void setBcata(String bcata) {
		this.bcata = bcata;
	}
	public String getBmenu() {
		return bmenu;
	}
	public void setBmenu(String bmenu) {
		this.bmenu = bmenu;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public String getBwriteday() {
		return bwriteday;
	}
	public String getBWrieday2() {
		String date =  getBwriteday();
		return date.substring(0,10);
	}
	public void setBwriteday(String bwriteday) {
		this.bwriteday = bwriteday;
	}
	public String getBcount() {
		return bcount;
	}
	public void setBcount(String bcount) {
		this.bcount = bcount;
	}
	public String getBdelyn() {
		return bdelyn;
	}
	public void setBdelyn(String bdelyn) {
		this.bdelyn = bdelyn;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getGidx() {
		return gidx;
	}
	public void setGidx(int gidx) {
		this.gidx = gidx;
	}
	public int getOriginbidx() {
		return originbidx;
	}
	public void setOriginbidx(int originbidx) {
		this.originbidx = originbidx;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getLlevel() {
		return llevel;
	}
	public void setLlevel(int llevel) {
		this.llevel = llevel;
	}
	private int llevel;
	
	
}