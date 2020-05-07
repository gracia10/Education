package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.jdbcUtil;

public class StudentDBBean {
	
	private static StudentDBBean instance = new StudentDBBean();
	
	public static StudentDBBean getInstance() {
		return instance;
	}
	
	private StudentDBBean() {}

	private Connection getConnection() throws Exception{
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}
	
	public StudentDataBean getStudent(int s_no) throws Exception{
		System.out.println("getStudent start!"+s_no);
		
		StudentDataBean student = new StudentDataBean();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		
		try {
			conn = getConnection();
			sql = "select * from student where s_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,s_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				student.setS_no(rs.getInt("s_no"));
				student.setS_name(rs.getString("s_name"));
				student.setS_birth(rs.getTimestamp("s_birth").toLocalDateTime().toLocalDate());
				student.setS_tel(rs.getInt("s_tel"));
				student.setT_id(rs.getString("t_id"));
				student.setU_id(rs.getString("u_id"));
				student.setU_grade(rs.getString("u_grade"));
				student.setS_img(rs.getString("s_img"));
			}	
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return student;
	}
	
	public List getStudents(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List studentList = null;
		String who ="";
		String sql="";
		
		if(id.contains("teacher")) {
			who = "t_id";
		}else{
			who = "u_id";
		}
		
		try {
			conn = getConnection();
			sql = "select * from student where "+who+"=? order by s_name";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				studentList = new ArrayList();
				do {
					StudentDataBean student = new StudentDataBean();
						student.setS_no(rs.getInt("s_no"));
						student.setS_name(rs.getString("s_name"));
						student.setS_birth(rs.getTimestamp("s_birth").toLocalDateTime().toLocalDate());
						student.setS_tel(rs.getInt("s_tel"));
						student.setT_id(rs.getString("t_id"));
						student.setU_id(rs.getString("u_id"));
						student.setU_grade(rs.getString("u_grade"));
						student.setS_img(rs.getString("s_img"));	
		              studentList.add(student);
				}while(rs.next());
				
			}else {
				studentList = Collections.EMPTY_LIST;
			}	
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			jdbcUtil.close(conn);
		}
		return studentList;
	}
}
