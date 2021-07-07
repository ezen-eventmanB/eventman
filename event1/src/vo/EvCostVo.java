package vo;

public class EvCostVo {

	private int cidx;
	private String CostName;
	private String CostStartDate;
	private String CostEndDate;
	private String CostWritedate;
	private String CostCatagory;
	private String CostText;
	private String CostFile;
	private String CostLocation;
	private String CostTarget;
	private String CostMethod;
	private String CostPrice;
	private String CostPeople;
	private String Ccount; 
	private String CName;

	
	public String getCcount() {
		return Ccount;
	}
	public void setCcount(String Ccount) {
		this.Ccount = Ccount;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	private int CostDelYn;
	private int midx;
	
	
	public String getCostFile() {
		return CostFile;
	}
	public void setCostFile(String costFile) {
		CostFile = costFile;
	}
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getCostName() {
		return CostName;
	}
	public void setCostName(String costName) {
		CostName = costName;
	}
	public String getCostStartDate() {
		return CostStartDate;
	}
	public String getCostStartDate2() {
		String date =  getCostStartDate();
		String startdate = date.substring(0,10);
		return startdate;
	}
	public void setCostStartDate(String costStartDate) {
		CostStartDate = costStartDate;
	}
	public String getCostEndDate() {
		return CostEndDate;
	}
	public String getCostEndDate2() {
		String date =  getCostEndDate();
		String enddate = date.substring(0,10);
		return enddate;
	}
	public void setCostEndDate(String costEndDate) {
		CostEndDate = costEndDate;
	}
	public String getCostCatagory() {
		return CostCatagory;
	}
	public void setCostCatagory(String costCatagory) {
		CostCatagory = costCatagory;
	}
	public String getCostText() {
		return CostText;
	}
	public void setCostText(String costText) {
		CostText = costText;
	}
	public String getCostLocation() {
		return CostLocation;
	}
	public void setCostLocation(String costLocation) {
		CostLocation = costLocation;
	}
	public String getCostTarget() {
		return CostTarget;
	}
	public void setCostTarget(String costTarget) {
		CostTarget = costTarget;
	}
	public String getCostMethod() {
		return CostMethod;
	}
	public void setCostMethod(String costMethod) {
		CostMethod = costMethod;
	}
	public String getCostPrice() {
		return CostPrice;
	}
	public void setCostPrice(String costPrice) {
		CostPrice = costPrice;
	}
	public String getCostPeople() {
		return CostPeople;
	}
	public void setCostPeople(String costPeople) {
		CostPeople = costPeople;
	}
	public int getCostDelYn() {
		return CostDelYn;
	}
	public void setCostDelYn(int costDelYn) {
		CostDelYn = costDelYn;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getCostWritedate() {
		return CostWritedate;
	}
	public void setCostWritedate(String costWritedate) {
		CostWritedate = costWritedate;
	}
}
