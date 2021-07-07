package service;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbconn.DBconn;
import vo.EvMemberVo;
import vo.EvBoardAskVo;
import vo.EvCostVo;

public class CostServiceImpl {

   private PreparedStatement pstmt; // ������ ��� �� ����
   private Connection conn; // �ڹٿ� ������ ���̽� ����

   public CostServiceImpl() {
      DBconn dbconn = new DBconn();
      this.conn = dbconn.getConnection();
   }  
   
   //������û �� �ѱ��
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
         
         //������ ���� �Ϸ�
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
   
         /* �������������� ������ �ۼ��� �� ����Ʈ �ҷ�����   */
         public ArrayList<EvCostVo> selectmycostlist(String midx) {
            
            ArrayList<EvCostVo> alistboard = new ArrayList();
            String sql ="select C.cidx, C.midx, C.cCata, C.cName, C.cWday, C.ccount, M.mname "
                     +"from "
                     +"EVE_COST C, EVE_MEMBER M "
                     +"where C.midx = M.midx and M.midx=? and cdelyn='N' order by cidx desc";
            
            try {
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, midx);
               ResultSet rs = pstmt.executeQuery();
               
               while(rs.next()) {
                  EvCostVo cv = new EvCostVo();
                  cv.setCidx(rs.getInt("cidx"));                  
                  cv.setCostCatagory(rs.getString("ccata"));                  
                  cv.setCostName(rs.getString("cname"));                  
                  cv.setCostWritedate(rs.getString("cwday"));                  
                  cv.setCcount(rs.getString("ccount"));                  
                  cv.setCName(rs.getString("mname"));
                  
                  alistboard.add(cv);
               }               
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }finally {
               try {
                  pstmt.close();
                  conn.close();
               } catch (SQLException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }
            }
            return alistboard;
         }
         
         /*	���������� ������û �� ��	*/
     	public int costCount(int midx) {
     		int count = 0;
     		
     		String sql = "select count(*) as cnt from EVE_COST where midx=? and cdelyn='N'";
     		
     		try {
     			pstmt = conn.prepareStatement(sql);
     			pstmt.setInt(1, midx);
     			ResultSet rs = pstmt.executeQuery();
     			
     			if(rs.next()) {
     				count = rs.getInt("cnt");
     			}
     			
     		} catch (SQLException e) {
     			// TODO Auto-generated catch block
     			e.printStackTrace();
     		}finally {
     			try {
     				pstmt.close();
     				conn.close();
     			} catch (SQLException e) {
     				// TODO Auto-generated catch block
     				e.printStackTrace();
     			}
     		}
     		return count;
     	}

      /*���������� �Խñ� �󼼺���*/
      public EvCostVo costlistselectone(int cidx) {
         
         System.out.println("costlistselectone ������û �󼼺���");
         
         String sql = "select * "
                  +"from EVE_COST C , EVE_MEMBER M "
                  +"where C.midx = M.midx "
                  +"and C.cidx=?";
         
         EvCostVo covo = new EvCostVo();

         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, cidx);
            
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	covo.setMidx(rs.getInt("midx"));
               covo.setCidx(rs.getInt("cidx")); //���� ��ȣ
               covo.setCostName(rs.getString("cName")); //���� �̸�
               covo.setCostStartDate(rs.getString("cSdate")); //���� ����
               covo.setCostEndDate(rs.getString("cSdate2")); //���� ����
               covo.setCostWritedate(rs.getString("cWday")); //���� �ۼ���
               covo.setCostCatagory(rs.getString("cCata")); //���� ī�װ�
               covo.setCostText(rs.getString("cText")); //���� ����
               covo.setCostLocation(rs.getString("cLoca")); //���� ���
               covo.setCostTarget(rs.getString("cTarget")); //�������
               covo.setCostMethod(rs.getString("cMethod")); //���� ���
               covo.setCostPrice(rs.getString("cPrice")); //���� ����
               covo.setCostPeople(rs.getString("cPeople")); //���� �����ο�
               covo.setCostFile(rs.getString("cfile2")); //���� ��û ����
            }
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            try {
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         
         return covo;
      }
      
      
      /*   ���������� ������û �����ϱ� �������� �̵�   .*/
      public EvCostVo costModify(int cidx) {
         
         String sql = "select * "
               +"from EVE_COST C , EVE_MEMBER M "
               +"where C.midx = M.midx "+"and B.bidx=?";
   
         EvCostVo covo = new EvCostVo();
         
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, cidx);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()) {
               covo.setCidx(rs.getInt("cidx"));
               covo.setCostStartDate(rs.getString("cSdate"));
               covo.setCostEndDate(rs.getString("cEdate"));
               covo.setCostCatagory(rs.getString("cCata"));
               covo.setCostText(rs.getString("cText"));
               covo.setCostLocation(rs.getString("cLoca"));
               covo.setCostTarget(rs.getString("cTarget"));
               covo.setCostMethod(rs.getString("cMethod"));
               covo.setCostPrice(rs.getString("cPrice"));
               covo.setCostPeople(rs.getString("cPeople"));
               covo.setCostFile(rs.getString("cfile"));
            }
            
            
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            try {
               pstmt.close();
               conn.close();
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
         
         return covo;
         
      }
   /*   ������û ���� �׼�   */
      public int costModifyAction(String cName, String cSdate, String cEdate,  
              String cCata, String cText,String cFile2,String cLoca,
              String cTarget, String cMethod, String cPrice,String cPeople,int cidx) {
						    	 
         int value=0;
         String sql = null;
         
   
            sql = "UPDATE EVE_COST SET CNAME=?, CSDATE=?, CSDATE2=?, CCATA=?,CTEXT=?,CFILE2=?,CLOCA=?,CTARGET=?,CMETHOD=?,CPRICE=?,CPEOPLE=? where cidx=?";
            
            try {
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, cName);
               pstmt.setString(2, cSdate);
               pstmt.setString(3, cEdate);
               pstmt.setString(4, cCata);
               pstmt.setString(5, cText);
               pstmt.setString(6, cFile2);
               pstmt.setString(7, cLoca);
               pstmt.setString(8, cTarget);
               pstmt.setString(9, cMethod);
               pstmt.setString(10, cPrice);
               pstmt.setString(11, cPeople);
               pstmt.setInt(12, cidx);
               value = pstmt.executeUpdate();
               
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }finally {
               try {
                  pstmt.close();
                  conn.close();
               } catch (SQLException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }
            }
   
         return value;
      }
      
      /*   ������û �����ϱ�      */   
      
      public int myPageCostDelete(int cidx) {
    	  
  		int value = 0;
  		
  		String sql = "UPDATE EVE_COST SET CDELYN='Y' where cidx=?";
  		
  		try {
  			pstmt=conn.prepareStatement(sql);
  			pstmt.setInt(1, cidx);
  			value = pstmt.executeUpdate();
  			
  		} catch (SQLException e) {
  			e.printStackTrace();
  		}finally {
  			try {
  				pstmt.close();
  				conn.close();
  			} catch (SQLException e) {
  				e.printStackTrace();
  			}
  		}
  		return value;
  	}
      
      /*   ������û Count   */
      public int hitCount(int cidx) {
         
         int value=0; 
         
         String sql = "update EVE_COST set ccount=ccount+1 where cidx=?";
         
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cidx);
            value = pstmt.executeUpdate();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         return value;
      }
}
