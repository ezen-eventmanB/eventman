package service;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBconn;
import vo.EvMemberVo;
import vo.EvCostVo;

public class CostServiceImpl {

	private PreparedStatement pstmt; // 쿼리문 대기 및 설정
	private Connection conn; // 자바와 데이터 베이스 연결

	public CostServiceImpl() {
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnection();
	}
	
	//견적신청 값 넘기기
	public int costInsert(String cName, String cSdate, String cEdate, String cWday, 
							String cCata, String cText,String fileName,String cLoca,
								String cTarget, String cMethod, String cPrice,String cPeople,String midx ) {
		
		System.out.println("cName"+cName);
		System.out.println("cSdate"+cSdate);
		System.out.println("cEdate"+cEdate);
		System.out.println("cWday"+cWday);
		System.out.println("cCata"+cCata);
		System.out.println("cText"+cText);
		System.out.println("cFile"+fileName);
		System.out.println("cLoca"+cLoca);
		System.out.println("cTarget"+cTarget);
		System.out.println("cMethod"+cMethod);
		System.out.println("cPrice"+cPrice);
		System.out.println("cPeople"+cPeople);
	
		
		int value = 0;

		try {
			String sql = "insert into EVE_COST(CIDX,CNAME,CSDATE,CSDATE2,CWDAY,CCATA,CTEXT,CFILE2,CLOCA,CTARGET,CMETHOD,CPRICE,CPEOPLE,MIDX) "
						+ "values(cidx_seq.nextval,?,?,?,sysdate,?,?,?,?,?,?,?,?,?)";
			
			//시퀀스 생성 완료
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cName);
			pstmt.setString(2, cSdate);
			pstmt.setString(3, cEdate);
			pstmt.setString(4, cCata);
			pstmt.setString(5, cText);
			pstmt.setString(6, fileName);
			pstmt.setString(7, cLoca);
			pstmt.setString(8, cTarget);
			pstmt.setString(9, cMethod);
			pstmt.setString(10, cPrice);
			pstmt.setString(11, cPeople);
			pstmt.setString(12, midx);

			value=pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

}
