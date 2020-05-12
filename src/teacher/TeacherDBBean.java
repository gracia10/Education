package teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import jdbc.jdbcUtil;
import student.StudentDBBean;
import student.StudentDataBean;

public class TeacherDBBean {

	private static TeacherDBBean instance = new TeacherDBBean();
	
	public static TeacherDBBean getInstance() {
		return instance;
	}
	
	private TeacherDBBean() {}

	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public String getName(String id) throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String t_name = "";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select t_name from teacher where t_id=?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				t_name = rs.getString(1);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return t_name;
	}
	

}
 