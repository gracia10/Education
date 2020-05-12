package Jo.teacher;

import java.sql.*;
import java.util.Vector;

import logon.LogonDataBean;
import logon.ZipcodeBean;

public class TeacherDBBean {//DB?? Í¥??†®?êú ?ùº?ùÑ ?ïò?äî ?Å¥?ûò?ä§: DBBean, DAO
   
	private static TeacherDBBean instance = new TeacherDBBean();
   
	//LogonDBBean m = TeacherDBBean.getInstance();
    public static TeacherDBBean getInstance() {
        return instance;
    }
   
    private TeacherDBBean() {}
   
    private Connection getConnection() throws Exception {
    	String jdbcDriver = "jdbc:apache:commons:dbcp:pool";        
    	return DriverManager.getConnection(jdbcDriver);
    }
     
    //inputPro.jsp
    public void insertUsers(TeacherDataBean teacher) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
 //DriverManager.getConnection(jdbc:apache:commons:dbcp:pool);
            pstmt = conn.prepareStatement(
            "insert into TEACHER values (?,?,?,?,?,?,?)");
            pstmt.setString(1, teacher.getT_id());
            pstmt.setString(2, teacher.getT_pass());
            pstmt.setString(3, teacher.getT_name());
            pstmt.setString(4, teacher.getT_tel());
            pstmt.setString(5, teacher.getT_birth());
            pstmt.setString(6, teacher.getZipcode());
            pstmt.setString(7, teacher.getT_addr());
            
            pstmt.executeUpdate();
        
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //loginPro.jsp
    public int userCheck(String t_id, String t_pass) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;    
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select t_pass from TEACHER where t_id = ?");
            pstmt.setString(1, t_id);
            rs= pstmt.executeQuery();

            if(rs.next()){
            	dbpasswd= rs.getString("t_pass");
            	if(dbpasswd.equals(t_pass))
            		x= 1; //?ù∏Ï¶? ?Ñ±Í≥?
            	else
            		x= 0; //ÎπÑÎ?Î≤àÌò∏ ??Î¶?
            }else
            	x= -1;//?ï¥?ãπ ?ïÑ?ù¥?îî ?óÜ?ùå

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return x;
    }
    
    //confirmId.jsp
    public int confirmId(String t_id) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int x=-1;//Í≤ΩÏö∞?ùò ?àò
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select t_id from TEACHER where t_id = ?");
            pstmt.setString(1, t_id);
            rs= pstmt.executeQuery();

            if(rs.next())
            	x= 1; //?ï¥?ãπ ?ïÑ?ù¥?îî ?ûà?ùå
            else
            	x= -1;//?ï¥?ãπ ?ïÑ?ù¥?îî ?óÜ?ùå
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return x;
    }
    
    //modifyForm.jsp
    public TeacherDataBean getUsers(String t_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        TeacherDataBean teacher=null;
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select * from TEACHER where t_id = ?");
            pstmt.setString(1, t_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	teacher = new TeacherDataBean();
            	teacher.setT_id(rs.getString("t_id"));
            	teacher.setT_pass(rs.getString("t_pass"));
            	teacher.setT_name(rs.getString("t_name"));
            	teacher.setT_tel(rs.getString("t_tel"));
            	teacher.setT_birth(rs.getString("t_birth"));
            	teacher.setZipcode(rs.getString("zipcode"));
            	teacher.setT_addr(rs.getString("t_addr"));
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return teacher;
    }
    //modifyPro.jsp
    public void updateUsers(TeacherDataBean teacher) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
"update TEACHER set t_pass=?,t_name=?,t_birth=?,t_tel=?,zipcode=?,t_addr=?" +
" where t_id=?");
            pstmt.setString(1, teacher.getT_pass());
            pstmt.setString(2, teacher.getT_name());
            pstmt.setString(3, teacher.getT_birth());
            pstmt.setString(4, teacher.getT_tel());
            pstmt.setString(5, teacher.getZipcode());
            pstmt.setString(6, teacher.getT_addr());
            pstmt.setString(7, teacher.getT_id());
           
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
   
    public int deleteUsers(String t_id, String t_pass) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select t_pass from TEACHER where t_id = ?");
            pstmt.setString(1, t_id);
            rs = pstmt.executeQuery();
           
            if(rs.next()){
            	dbpasswd= rs.getString("t_pass");
            	if(dbpasswd.equals(t_pass)){
            		pstmt = conn.prepareStatement(
                  "delete from TEACHER where t_id=?");
                    pstmt.setString(1, t_id);
                    pstmt.executeUpdate();
                    x= 1; //?öå?õê?Éà?á¥ ?Ñ±Í≥?
            	}else
            		x= 0; //ÎπÑÎ?Î≤àÌò∏ ??Î¶?
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
    
    public Vector zipcodeRead(String area4)  {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        
        try {
            con = getConnection();
            String strQuery = "select * from zipcode where area4 like '"+area4+"%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null) try { con.close(); } catch(SQLException ex) {}
        }
        return vecList;
    }
  
    // findId
    public String findId(String t_name ,String t_birth) {
		
    	String t_id = null;
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    	
        try {
			con = getConnection();
		
        String strQuery = "select t_id from TEACHER where t_name=? and t_birth=?";
        pstmt = con.prepareStatement(strQuery);
        pstmt.setString(1, t_name);
        pstmt.setString(2, t_birth);
        
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
        	t_id = rs.getString("t_id");
        }
        
        } catch (Exception e) {
			e.printStackTrace();
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null) try { con.close(); } catch(SQLException ex) {}
        }
        return t_id;
    }
    
    // findPwd
    public int findPwd(String t_id, String t_name) {
    	int tpwcheck = 0;  
    	 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs= null;
                  
         try {
         	conn = getConnection();

             pstmt = conn.prepareStatement(
             "select t_pass from TEACHER where t_id = ? and t_name=?");
             pstmt.setString(1, t_id);
             pstmt.setString(2, t_name);
             rs = pstmt.executeQuery();
            
             if(rs.next()){
             	tpwcheck= 1; 
             }
         } catch(Exception ex) {
             ex.printStackTrace();
         } finally {
             if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
    	return tpwcheck;
    }
    
    // updatePwd
    public void updatePwd(String t_id, String t_pass) {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
        
         try {
             conn = getConnection();
            
             pstmt = conn.prepareStatement(
            		 "update TEACHER set t_pass=? where t_id=?");
             pstmt.setString(1, t_pass);
             pstmt.setString(2, t_id);
             pstmt.executeUpdate();
             
         } catch(Exception ex) {
             ex.printStackTrace();
         } finally {
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
    }
    
    
    
}