package users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import diary.DiaryDataBean;
import jdbc.jdbcUtil;
import student.StudentDataBean;

public class UsersDBBean {

	private static UsersDBBean instance = new UsersDBBean();
	
	public static UsersDBBean getInstance() {
		return instance;
	}
	
	private UsersDBBean() {}

	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	

    public UsersDataBean getUser(String u_id) throws Exception {
		
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UsersDataBean user =null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from users where u_id=?");
			pstmt.setString(1,u_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	user = new UsersDataBean();
            	user.setU_id(rs.getString("u_id"));
            	user.setU_pass(rs.getString("u_pass"));
            	user.setU_name(rs.getString("u_name"));
            	user.setU_tel(rs.getString("u_tel"));
            	user.setU_birth(rs.getTimestamp("u_birth"));
            	user.setZipcode(rs.getInt("zipcode"));
            	user.setU_addr(rs.getString("u_addr"));
            	user.setU_grade(rs.getString("u_grade"));
            	
	   	       	if(user.getU_addr() == null) {
	   	       		user.setU_addr("none");
	   	       	}
            }            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return user;
    }
	
	public String getName(String id) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String u_name = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select u_name from users where u_id=?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				u_name = rs.getString(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return u_name;
	}
}

