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
	         String sql = "insert into EVE_COST(CNAME,CSDATE,CSDATE2,CWDAY,CCATA,CTEXT,CFILE,CLOCA,CTARGET,CMETHOD,CPRICE,CPEOPLE,MIDX,Ccondition) "
	                  + "values(?,?,?,NOW(),?,?,?,?,?,?,?,?,?,'견적등록완료')";
	         
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
	   
	         /* 마이페이지에서 본인이 작성한 글 리스트 불러오기   */
	         public ArrayList<EvCostVo> selectmycostlist(String midx) {
	            
	            ArrayList<EvCostVo> alistboard = new ArrayList();
	            String sql ="select C.cidx, C.midx, C.cCata, C.cName, C.cWday, C.ccount, M.mname, C.Ccondition "
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
	                  cv.setCcondition(rs.getString("Ccondition"));
	                  
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
	         
	         
	         /*	마이페이지 견적신청 글 수	*/
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
	
	     	
	      /*마이페이지 게시글 상세보기*/
	      public EvCostVo costlistselectone(int cidx) {
	         
	         System.out.println("costlistselectone 견적신청 상세보기");
	         
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
	               covo.setCidx(rs.getInt("cidx")); //견적 번호
	               covo.setCostName(rs.getString("cName")); //견적 이름
	               covo.setCostStartDate(rs.getString("cSdate")); //견적 시작
	               covo.setCostEndDate(rs.getString("cSdate2")); //견적 종료
	               covo.setCostWritedate(rs.getString("cWday")); //견적 작성일
	               covo.setCostCatagory(rs.getString("cCata")); //견적 카테고리
	               covo.setCostText(rs.getString("cText")); //견적 내용
	               covo.setCostLocation(rs.getString("cLoca")); //견적 장소
	               covo.setCostTarget(rs.getString("cTarget")); //견적대상
	               covo.setCostMethod(rs.getString("cMethod")); //견적 방식
	               covo.setCostPrice(rs.getString("cPrice")); //견적 예산
	               covo.setCostPeople(rs.getString("cPeople")); //견적 참여인원
	               covo.setCostFile(rs.getString("cfile2")); //견적 신청 파일
	               covo.setCcondition(rs.getString("Ccondition"));
	               covo.setCreply(rs.getString("creply"));
	            }
	            
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
	         return covo;
	      }
	      
	      /*   마이페이지 견적신청 수정하기 페이지로 이동   .*/
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
	            e.printStackTrace();
	         }finally {
	            try {
	               pstmt.close();
	               conn.close();
	            } catch (SQLException e) {
	               e.printStackTrace();
	            }
	         }
	         return covo;
	      }
	   /*   견적신청 수정 액션   */
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
	      
	      /*   견적신청 삭제하기      */   
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
	      
	      /*   견적신청 Count   */
	      public int hitCount(int cidx) {
	         
	         int value=0; 
	         System.out.println(cidx);
	         String sql = "update EVE_COST set ccount=ccount+1 where cidx=?";
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, cidx);
	            value = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	         return value;
	      }
	      
		      /*마이페이지 갈때 견적신청 모든 부분 카운트*/
			public int allSelectCost() {
			
			
			int allcount=0;
			
			String sql = "select count(*) as cnt from EVE_COST where cdelyn='N'";
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					allcount = (rs.getInt("cnt"));
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
			
			
			return allcount;
		}


		public int masterreply(int cidx, String creply) {
			int value = 0;
				
				String sql = "UPDATE EVE_COST SET CCONDITION='상담중' , CREPLY = ? where cidx=?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, creply);
					pstmt.setInt(2, cidx);
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
				
			System.out.println("리플 된 항목수는 : "+value);
			return value;
		}

/* 상담 완료 처리하기	*/		
		public int finshreply(int cidx) {
			int value = 0;
			
			String sql = "UPDATE EVE_COST SET CCONDITION='상담완료' where cidx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cidx);
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
	}

