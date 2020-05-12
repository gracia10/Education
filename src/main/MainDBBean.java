package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDataBean;
import manage.TeacherProfileDataBean;

public class MainDBBean {
	private static MainDBBean instance = new MainDBBean();
	
	public static MainDBBean getInstance() {
		return instance;
	}
	
	private MainDBBean() {
	}
	
	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	//상담 신청
	public void insert_consult
	(String date, String name, String tel, String time, String service, String t_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "insert into CONSULT values(seq_c_num.nextval,?,?,?,?,?,?)");
            pstmt.setString(1, date);
            pstmt.setString(2, name);
            pstmt.setString(3, tel);
            pstmt.setString(4, time);
            pstmt.setString(5, service);
            pstmt.setString(6, t_id);
            pstmt.executeUpdate();          
                        
            conn.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	
	//메인이미지 불러오기
	//MainAction.java
	public ArrayList<MainDataBean> get_mainImg () throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<MainDataBean> list = new ArrayList<MainDataBean>();
        ResultSet rs = null;
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select * from main_img where m_type = 'main_img'");
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
            	MainDataBean data = new MainDataBean();
            	data.setMain_img(rs.getString("main_img"));
            	list.add(data);
            }          
                        
            conn.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return list;
    }
	
	
	//보석 소개 이미지 불러오기
	//IntroAction.java
	public ArrayList<MainDataBean> get_introImg () throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<MainDataBean> list = new ArrayList<MainDataBean>();
        ResultSet rs = null;
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select * from main_img where m_type = 'introduce_img'");
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
            	MainDataBean data = new MainDataBean();
            	data.setMain_img(rs.getString("main_img"));
            	data.setMain_subject(rs.getString("main_subject"));
            	data.setMain_content(rs.getString("main_content"));
            	list.add(data);
            }          
                        
            conn.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return list;
    }
	
	
	//서비스 소개 이미지 불러오기
	//ServiceAction.java
	public ArrayList<MainDataBean> get_serviceImg () throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ArrayList<MainDataBean> list = new ArrayList<MainDataBean>();
        ResultSet rs = null;
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select * from main_img where m_type = 'service_img'");
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
            	MainDataBean data = new MainDataBean();
            	data.setMain_img(rs.getString("main_img"));
            	data.setMain_subject(rs.getString("main_subject"));
            	data.setMain_content(rs.getString("main_content"));
            	list.add(data);
            }          
                        
            conn.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return list;
    }
	
	
	//선생님 소개 페이지
	//TeacherIntroAction.java
	
	//선생님 이름 조회하기
	public MainDataBean getTeacherProfile_name(String t_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// ManageDataBean users = null;
		MainDataBean profile = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from t_profile,teacher where t_profile.t_id=teacher.t_id and t_profile.t_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				profile = new MainDataBean();
				profile.setT_id(rs.getString("t_id"));
				profile.setT_name(rs.getString("t_name"));

			}
			System.out.println("완료");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return profile;
	}
	
	//선생님 프로필 불러오기 (((보류중...)))
	public MainDataBean getTeacherProfile_list(String t_id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// ManageDataBean users = null;
		MainDataBean profile = null;
		String sql = "";

		try {
			conn = getConnection();
			sql = "select * from t_profile,teacher where t_profile.t_id=teacher.t_id and t_profile.t_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_id);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				profile = new MainDataBean();
				profile.setT_id(rs.getString("t_id"));
				profile.setT_intro(rs.getString("t_intro"));
				profile.setT_career(rs.getString("t_career"));
				profile.setT_img(rs.getString("t_img"));
				profile.setT_name(rs.getString("t_name"));
				profile.setT_tel(rs.getString("t_tel"));

				//profileList.add(profile);
			}
			System.out.println("완료");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return profile;
	}
	
	
	//선생님 프로필 (선생님 목록)
		public ArrayList getT_ProfileList() throws Exception {

			// DB초기화
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			ManageDataBean users = null;
			ArrayList vecList = new ArrayList();
			String sql = "";

			try {
				conn = getConnection();
				sql = "select * from t_profile,teacher where t_profile.t_id=teacher.t_id";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ManageDataBean usersList = new ManageDataBean();
					usersList.setT_id(rs.getString("t_id"));
					usersList.setT_name(rs.getString("t_name"));
							
					vecList.add(usersList);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
			return vecList;
		}
	
	//선생님 프로필 불러오기
		   public ArrayList<MainDataBean> getTeacherProfile(String t_id) throws Exception {
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;

			      ArrayList<MainDataBean> profileList = new ArrayList<MainDataBean>();
			      String sql = "";

			      try {
			         conn = getConnection();
			         sql = "select * from t_profile,teacher where t_profile.t_id=teacher.t_id and teacher.t_id=?";
			         pstmt = conn.prepareStatement(sql);
			         pstmt.setString(1, t_id);
			         
			         rs = pstmt.executeQuery();

			         while (rs.next()) {
			            MainDataBean profile = new MainDataBean();
			            profile.setT_id(rs.getString("t_id"));
			            profile.setT_intro(rs.getString("t_intro"));
			            profile.setT_career(rs.getString("t_career"));
			            profile.setT_img(rs.getString("t_img"));
			            profile.setT_name(rs.getString("t_name"));
			            profile.setT_tel(rs.getString("t_tel"));

			            profileList.add(profile);
			         }           
			                     
			         
			         System.out.println("완료");
			      } catch (Exception ex) {
			         ex.printStackTrace();
			      } finally {
			         if (rs != null)
			            try {
			               rs.close();
			            } catch (SQLException ex) {
			            }
			         if (pstmt != null)
			            try {
			               pstmt.close();
			            } catch (SQLException ex) {
			            }
			         if (conn != null)
			            try {
			               conn.close();
			            } catch (SQLException ex) {
			            }
			      }
			      return profileList;
			   }
	
		// * ------------------------------------------- 공지게시판 --------------------------------
		   
		    // 공지게시판 전체 글 개수 리턴
		    public int getNoticeCount() throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        int x=0;

		        try {
		            conn = getConnection();
		           
		            pstmt = conn.prepareStatement("select count(*) from Notice");
		            rs = pstmt.executeQuery();

		            if (rs.next()) {
		               x= rs.getInt(1); // 인덱스 걍 1번�에 있는놈 가져오는거, count(*)가 컬럼명이 아니라서
		            	}
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return x;
		    }
		    
		    // 공지게시판 어디부터 어디까지 글만 리턴
		    public List getNoticelist(int start, int end) throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        List articleList=null;
		        try {
		            conn = getConnection();
		           
		            pstmt = conn.prepareStatement("select n_num,n_subject,n_content,n_readcount,n_reg_date, r "
		            		+ "from (select n_num,n_subject,n_content,n_readcount,n_reg_date, rownum r "
		            		+ "from (select * from Notice order by n_num desc)) where r>=? and r<=?");
		            pstmt.setInt(1, start);
		            pstmt.setInt(2, end);
		            rs = pstmt.executeQuery();

		            if (rs.next()) {
		                articleList = new ArrayList(end);
		                do{
		                  NoticeDataBean article= new NoticeDataBean();
		                  article.setN_num(rs.getInt("n_num"));
		                  article.setN_subject(rs.getString("n_subject"));
		                  article.setN_content(rs.getString("n_content"));
		                  article.setN_readcount(rs.getInt("n_readcount"));
		                  article.setN_reg_date(rs.getTimestamp("n_reg_date"));

		                  articleList.add(article);
		                }while(rs.next());
		            }
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return articleList;
		    }
		    
		    // 서치 해당 글 개수 리턴
		    public int getNoticeCount(String search, String string) throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        
		     	if(search.equals("제목")){
		    		search = "n_subject";
		    	} else{
		    		search = "n_content";
		    	} 
		        int x=0;

		        try {
		            conn = getConnection();
		           
		            String strQuery = "select count(*) from Notice where "+search+" like '%"+string+"%'";
		            pstmt = conn.prepareStatement(strQuery);
		            rs = pstmt.executeQuery();
		            if (rs.next()) {
		               x= rs.getInt(1); // 인덱스 걍 1번�에 있는놈 가져오는거, count(*)가 컬럼명이 아니라서
		            }
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return x;
		    }
		    
		    // 서치 관련 해당 글 리스트
		    public List getNoticelist(int start, int end, String search, String string) throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs = null;
		        List articleList=null;
		        
		     	if(search.equals("제목")){
		    		search = "n_subject";
		    	} else{
		    		search = "n_content";
		    	} 
		     	
		        try {
		            conn = getConnection();
		           
		            pstmt = conn.prepareStatement("select n_num,n_subject,n_content,n_readcount,n_reg_date, r "
		            		+ "from (select n_num,n_subject,n_content,n_readcount,n_reg_date, rownum r "
		            		+ "from (select * from Notice where "+search+" like '%"+string+"%' order by n_num desc)) where r>=? and r<=?");
		            pstmt.setInt(1, start);
		            pstmt.setInt(2, end);
		            rs = pstmt.executeQuery();

		            if (rs.next()) {
		                articleList = new ArrayList(end);
		                do{
		                  NoticeDataBean article= new NoticeDataBean();
		                  article.setN_num(rs.getInt("n_num"));
		                  article.setN_subject(rs.getString("n_subject"));
		                  article.setN_content(rs.getString("n_content"));
		                  article.setN_readcount(rs.getInt("n_readcount"));
		                  article.setN_reg_date(rs.getTimestamp("n_reg_date"));

		                  articleList.add(article);
		                }while(rs.next());
		            }
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return articleList;
		    }
		    
		    // 공지사항 글 추가
		    public void insert_NoticeArticle(NoticeDataBean article) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
										
		            pstmt = conn.prepareStatement(
		            "insert into notice values(seq_n_num.nextval,?,?,?,?)");
					pstmt.setString(1, article.getN_subject());
					pstmt.setString(2, article.getN_content());
					pstmt.setInt(3, article.getN_readcount());
					pstmt.setTimestamp(4, article.getN_reg_date());
					
					pstmt.executeUpdate();
					conn.commit();
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
			}
		    
		    
			// 자료게시판 글 넣을때 시퀀스 번호 확인
		    public int get_seq_n_num() throws Exception {
		        Connection conn = null;
		        PreparedStatement pstmt = null;
		        ResultSet rs= null;
		        int x = 1;
		        
		        try {
		        	conn = getConnection();

		            pstmt = conn.prepareStatement(
		            "select * from notice order by n_num");
		            rs = pstmt.executeQuery();
		           
		            while(rs.next()){
		            	x = rs.getInt("n_num");
		            	x = x+1;
		            }
		        } catch(Exception ex) {
		            ex.printStackTrace();
		        } finally {
		            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
		        return x;
		    }
		    
			// 자료게시판 글 추가 할때 파일 추가
			public void insert_NoticeLoadArticle(int n_num, ArrayList list) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					
		            for(int i=0; i<list.size(); i++) {
		                pstmt = conn.prepareStatement( "insert into notice_img values(?,?,?)");
		            	NoticeLoadDataBean img1 = (NoticeLoadDataBean)list.get(i);
		    			pstmt.setInt(1, n_num);
		    			pstmt.setString(2, img1.getNo_subject());
		    			pstmt.setString(3, img1.getNo_path());
		                pstmt.executeUpdate();
		                
		    			conn.commit();
		            }
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
			}
			
			public NoticeDataBean getArticle(int n_num) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt1 = null;
				ResultSet rs = null;
				NoticeDataBean article = null;
				
				try {
					conn =  getConnection();
							
					pstmt1 = conn.prepareStatement(
							"update Notice set n_readcount=n_readcount+1 where n_num=?");
					pstmt1.setInt(1, n_num);
					pstmt1.executeUpdate();
					
					
					pstmt = conn.prepareStatement(
							"select * from notice where n_num = ?");
					pstmt.setInt(1, n_num);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						article = new NoticeDataBean();
						article.setN_num(rs.getInt("n_num"));
						article.setN_subject(rs.getString("n_subject"));
						article.setN_content(rs.getString("n_content"));
						article.setN_readcount(rs.getInt("n_readcount"));
						article.setN_reg_date(rs.getTimestamp("n_reg_date"));
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
				return article;
			}
		   
			// 글 한개에 해당하는 자료들 여러개 리턴
			public ArrayList<NoticeLoadDataBean> getArticles_load(int n_num) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				NoticeLoadDataBean article = null;
				ArrayList<NoticeLoadDataBean> list = new ArrayList<NoticeLoadDataBean>();
				
				try {
					conn =  getConnection();
							
					pstmt = conn.prepareStatement(
							"select*from notice_img natural join notice where n_num = ?");
					pstmt.setInt(1, n_num);
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						article = new NoticeLoadDataBean();
						article.setN_num(rs.getInt("n_num"));
						article.setNo_subject(rs.getString("no_subject"));
						article.setNo_path(rs.getString("no_path"));
						list.add(article);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
				return list;
			}
			
			// 자료게시판 글 수정
			public int modify_NoticeArticle(NoticeDataBean article) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String dbpasswd = "";
				String sql = "";
				int x = -1;

				try {
					conn =  getConnection();

					sql = "update Notice set n_subject=?, n_content=? where n_num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getN_subject());
					pstmt.setString(2, article.getN_content());
					pstmt.setInt(3, article.getN_num());

					pstmt.executeUpdate();
					conn.commit();
					x = 1;

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
				return x;
			}
			
			// 글 삭제
			public int delete_NoticeArticle(int n_num) throws Exception {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				int x = -1;
				
				try {
					conn =  getConnection();
		

					pstmt = conn.prepareStatement("delete from Notice where n_num=?");
					pstmt.setInt(1, n_num);
					pstmt.executeUpdate();
					x = 1;

					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (rs != null) try { rs.close(); } catch (Exception ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
					if (conn != null) try { conn.close(); } catch (Exception ex) {}
				}
				return x;
			}
			   //문의게시판 (qna) 
			   //QnaAction.java
			   public ArrayList<MainDataBean> getQnaList() throws Exception {
				      Connection conn = null;
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;

				      ArrayList<MainDataBean> qnaList = new ArrayList<MainDataBean>();
				      String sql = "";

				      try {
				         conn = getConnection();
				         sql = "select * from inquiry";
				         pstmt = conn.prepareStatement(sql);
				         //pstmt.setString(1, t_id);
				         
				         rs = pstmt.executeQuery();

				         while (rs.next()) {
				            MainDataBean qna = new MainDataBean();
				            qna.setI_num(rs.getInt("i_num"));
				            qna.setI_subject(rs.getString("i_subject"));
				            qna.setI_content(rs.getString("i_content"));

				            qnaList.add(qna);
				         }           
				                     
				         
				         System.out.println("완료");
				      } catch (Exception ex) {
				         ex.printStackTrace();
				      } finally {
				         if (rs != null)
				            try {
				               rs.close();
				            } catch (SQLException ex) {
				            }
				         if (pstmt != null)
				            try {
				               pstmt.close();
				            } catch (SQLException ex) {
				            }
				         if (conn != null)
				            try {
				               conn.close();
				            } catch (SQLException ex) {
				            }
				      }
				      return qnaList;
				   }
			   
			 //문의게시판 (qna) - 글 등록하기
			   //QnaAction.java
			   public void insert_qna
				(int i_num, String i_subject, String i_content) throws Exception {
			        Connection conn = null;
			        PreparedStatement pstmt = null;
			        
			        try {
			        	conn = getConnection();

			            pstmt = conn.prepareStatement(
			            "insert into INQUIRY values(seq_i_num.nextval,?,?)");
			            pstmt.setString(1, i_subject);
			            pstmt.setString(2, i_content);

			            pstmt.executeUpdate();          
			                        
			            conn.commit();
			        } catch(Exception ex) {
			            ex.printStackTrace();
			        } finally {
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
			    }
			   
			 //문의게시판 (qna) - 글 삭제하기
			   //QnaAction.java
				public void delete_qna(int i_num) throws Exception {
					Connection conn = null;
					PreparedStatement pstmt = null;
					PreparedStatement pstmt1 = null;
					ResultSet rs = null;
					
					try {
			        	conn = getConnection();
			        	        	
			           pstmt = conn.prepareStatement("select * from INQUIRY where i_num = ?");
			            pstmt.setInt(1, i_num);
			            rs = pstmt.executeQuery();
			           
			            if(rs.next()){
			            		pstmt1 = conn.prepareStatement("delete from INQUIRY where i_num = ?");
			                    pstmt1.setInt(1, i_num);
			                    pstmt1.executeUpdate();
			            }
			        } catch(Exception ex) {
			        	ex.printStackTrace();
			            
			        } finally {
			            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			            if (pstmt1 != null) try { pstmt1.close(); } catch(SQLException ex) {}
			            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			        }
			    }
				
				// 문의게시판 글 수정하기
				
				//select문 (문의게시판 수정)
				//modifyTeacherProfileAction.java
				public MainDataBean getQnaContent(int i_num) throws Exception {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					MainDataBean content = null;
					try {
						conn = getConnection();
						pstmt = conn.prepareStatement("select * from INQUIRY where i_num=?");
						pstmt.setInt(1, i_num);
						rs = pstmt.executeQuery();
						System.out.println("************11");
						if (rs.next()) {
							content = new MainDataBean();
							content.setI_num(rs.getInt("i_num"));
							content.setI_subject(rs.getString("i_subject"));
							content.setI_content(rs.getString("i_content"));
							System.out.println("************2222");
						}
					} catch (Exception ex) {
						ex.printStackTrace();
					} finally {
						if (rs != null)
							try {
								rs.close();
							} catch (SQLException ex) {
							}
						if (pstmt != null)
							try {
								pstmt.close();
							} catch (SQLException ex) {
							}
						if (conn != null)
							try {
								conn.close();
							} catch (SQLException ex) {
							}
					}
					return content;
				}
				
				//update문 (문의게시판 수정)
				//modifyTeacherProfileAction.java
				public void updateQna(int i_num, String i_subject, String i_content) throws Exception {
					Connection conn = null;
			        PreparedStatement pstmt = null;
			       
			        try {
			            conn = getConnection();
			            pstmt = conn.prepareStatement("update INQUIRY "
			            		+ "set i_subject=?, i_content=? "
			            		+ " where i_num=?");
			            pstmt.setString(1, i_subject);
			            pstmt.setString(2, i_content);
			            pstmt.setInt(3, i_num);

			            pstmt.executeUpdate();
			            conn.commit();
			        } catch (Exception ex) {
						ex.printStackTrace();
					} finally {
						if (pstmt != null)
							try {
								pstmt.close();
							} catch (SQLException ex) {
							}
						if (conn != null)
							try {
								conn.close();
							} catch (SQLException ex) {
							}
					}
				}
		   
}
