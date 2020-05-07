package diary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.jdbcUtil;

public class DiaryDBBean {

	private static DiaryDBBean instance = new DiaryDBBean();
	
	public static DiaryDBBean getInstance() {
		return instance;
	}
	
	private DiaryDBBean() {}
	
	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public int insertArticle(DiaryDataBean article)throws Exception{
		System.out.println("[디비빈시작]글을 등록합니다!");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result=0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("insert into diary(d_num,d_yy,d_mm,d_dd,d_subject,d_content,d_date,s_no) values(seq_d_num.NEXTVAL,?,?,?,?,?,?,?)");
			
			pstmt.setInt(1, article.getD_yy());
			pstmt.setInt(2, article.getD_mm());
			pstmt.setInt(3, article.getD_dd());
			pstmt.setString(4, article.getD_subject());
			pstmt.setString(5, article.getD_content());
			pstmt.setTimestamp(6, article.getD_date());
			pstmt.setInt(7, article.getS_no());
			
			result = pstmt.executeUpdate();	
			
			if(result == 1) {
				System.out.println("[성공]글이 등록되었습니다 짝짝");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return result;
	}
	
	public List getArticles(int d_yy,int d_mm,int s_no)throws Exception{
		System.out.println("일지 목록을 가져옵니다. "+d_yy+"/"+d_mm+"/"+s_no);		

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;

		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from diary where d_yy=? and d_mm=? and s_no=? order by d_dd");
			pstmt.setInt(1,d_yy);
			pstmt.setInt(2,d_mm);
			pstmt.setInt(3,s_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList();
				do {
					DiaryDataBean article = new DiaryDataBean();
	                  article.setD_num(rs.getInt("d_num"));
	                  article.setD_yy(rs.getInt("d_yy"));
	                  article.setD_mm(rs.getInt("d_mm"));
	                  article.setD_dd(rs.getInt("d_dd"));
	                  article.setD_subject(rs.getString("d_subject"));
	                  article.setD_content(rs.getString("d_content"));
	                  article.setD_date(rs.getTimestamp("d_date"));
	                  article.setS_no(rs.getInt("s_no"));
	                  
	                  articleList.add(article);
				}while(rs.next());
			}else {
				articleList = Collections.EMPTY_LIST;
			}		
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return articleList;
	}
	
    public DiaryDataBean getArticle(int d_num) throws Exception {
		System.out.println("[getArticle실행]");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        DiaryDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            		"select * from diary where d_num=?");
			pstmt.setInt(1,d_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new DiaryDataBean();
                article.setD_num(rs.getInt("d_num"));
                article.setD_yy(rs.getInt("d_yy"));
                article.setD_mm(rs.getInt("d_mm"));
                article.setD_dd(rs.getInt("d_dd"));
                article.setD_subject(rs.getString("d_subject"));
                article.setD_content(rs.getString("d_content"));
                article.setD_date(rs.getTimestamp("d_date"));
                article.setS_no(rs.getInt("s_no"));
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		System.out.println("[getArticle 완료!]"+article.getD_content());
        return article;
    }
	
    public int updateArticle(DiaryDataBean article) throws Exception{
    	System.out.println("[updateArticle실행]");
		
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	String sql="";
    	int result = 0;
    	
    	try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update diary set d_yy=?,d_mm=?,d_dd=?,d_subject=?,d_content=?,d_date=?,s_no=? where d_num=?");
			pstmt.setInt(1, article.getD_yy());
			pstmt.setInt(2, article.getD_mm());
			pstmt.setInt(3, article.getD_dd());
			pstmt.setString(4, article.getD_subject());
			pstmt.setString(5, article.getD_content());
			pstmt.setTimestamp(6, article.getD_date());
			pstmt.setInt(7, article.getS_no());
			pstmt.setInt(8, article.getD_num());
			result = pstmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆[경축]성공적으로 업데이트 되었습니다!☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆");
			}else {
				System.out.println("ㅠㅠ실패");
			}
		} catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    	return result;
    }
    
	public List getDate(int s_no)throws Exception{
		System.out.println("[자바빈]학생의 일지 일자를 가져옵니다./"+s_no);		

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List dateList = null;
		String date = "";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select d_yy,d_mm,d_dd from diary where s_no=?");
			pstmt.setInt(1,s_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dateList = new ArrayList();
				do {
					date = LocalDate.of(rs.getInt(1),rs.getInt(2),rs.getInt(3)).toString();
					dateList.add(date);
				}while(rs.next());
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
        System.out.println("결과"+dateList);
		return dateList;
	}
    
	
    public int deleteArticle(int d_num) throws Exception{
    	System.out.println("[updateArticle실행]");
		
    	Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("delete from diary where d_num=?");
			pstmt.setInt(1,d_num);
			result = pstmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("[성공]");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return result;
    }
    

}




















