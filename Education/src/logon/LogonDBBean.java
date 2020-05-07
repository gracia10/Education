package logon;

import java.sql.*;
import java.util.ArrayList;
import logon.ZipcodeBean;


public class LogonDBBean {//DB와 관련된 일을 하는 클래스: DBBean, DAO
   
	private static LogonDBBean instance = new LogonDBBean();
   
	//LogonDBBean m = LogonDBBean.getInstance();
    public static LogonDBBean getInstance() {
        return instance;
    }
   
/*    private LogonDBBean() {}*/
    private LogonDBBean() {}
   
    private Connection getConnection() throws Exception {
    	String jdbcDriver = "jdbc:apache:commons:dbcp:pool";        
    	return DriverManager.getConnection(jdbcDriver);
    }
     
    //inputPro.jsp
    public void insertUsers(LogonDataBean users) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
 //DriverManager.getConnection(jdbc:apache:commons:dbcp:pool);
            pstmt = conn.prepareStatement(
            "insert into USERS values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, users.getU_id());
            pstmt.setString(2, users.getU_pass());
            pstmt.setString(3, users.getU_name());
            pstmt.setString(4, users.getU_tel());
            pstmt.setString(5, users.getU_birth());
            pstmt.setString(6, users.getZipcode());
            pstmt.setString(7, users.getU_addr());
            pstmt.setString(8, users.getU_grade());
            
            pstmt.executeUpdate();
        
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    //loginPro.jsp
    public int userCheck(String u_id, String u_pass) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;    
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select u_pass from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs= pstmt.executeQuery();

            if(rs.next()){
            	dbpasswd= rs.getString("u_pass");
            	if(dbpasswd.equals(u_pass))
            		x= 1; //인증 성공
            	else
            		x= 0; //비밀번호 틀림
            }else
            	x= -1;//해당 아이디 없음

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
    public int confirmId(String u_id) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int x=-1;//경우의 수
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select u_id from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs= pstmt.executeQuery();

            if(rs.next())
            	x= 1; //해당 아이디 있음
            else
            	x= -1;//해당 아이디 없음
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
        	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return x;
    }
    
    // inputForm.jsp
    public int inputForm(String u_id) throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int x=-1;//경우의 수
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select u_id from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs= pstmt.executeQuery();

            if(rs.next())
            	x= 1; //해당 아이디 있음
            else
            	x= -1;//해당 아이디 없음
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
    public LogonDataBean getUsers(String u_id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LogonDataBean users=null;
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            "select * from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	users = new LogonDataBean();
            	users.setU_id(rs.getString("u_id"));
            	users.setU_pass(rs.getString("u_pass"));
            	users.setU_name(rs.getString("u_name"));
            	users.setU_tel(rs.getString("u_tel"));
            	users.setU_birth(rs.getString("u_birth"));
            	users.setZipcode(rs.getString("zipcode"));
            	users.setU_addr(rs.getString("u_addr"));
            	users.setU_grade(rs.getString("u_grade"));    
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return users;
    }
    //modifyPro.jsp
    public void updateUsers(LogonDataBean users) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
"update USERS set u_pass=?,u_name=?,u_birth=?,u_tel=?,zipcode=?,u_addr=?" +
" where u_id=?");
            pstmt.setString(1, users.getU_pass());
            pstmt.setString(2, users.getU_name());
            pstmt.setString(3, users.getU_birth());
            pstmt.setString(4, users.getU_tel());
            pstmt.setString(5, users.getZipcode());
            pstmt.setString(6, users.getU_addr());
            pstmt.setString(7, users.getU_id());
           
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
   
    // deleteUsers
    public int deleteUsers(String u_id, String u_pass) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select u_pass from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();
           
            if(rs.next()){
            	dbpasswd= rs.getString("u_pass");
            	if(dbpasswd.equals(u_pass)){
            		pstmt = conn.prepareStatement(
                  "delete from USERS where u_id=?");
                    pstmt.setString(1, u_id);
                    pstmt.executeUpdate();
                    x= 1; //회원탈퇴 성공
            	}else
            		x= 0; //비밀번호 틀림
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
    
	//우편번호 탐색 : 동 이름으로 우편번호 탐색
	public ArrayList<ZipcodeBean> zipcodeRead(String area4){
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		ArrayList<ZipcodeBean> list = new ArrayList<ZipcodeBean>();
		try {
            con = getConnection();
            String strQuery = "select * from zipcode where area4 like'"+area4+"%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
			while(rs.next()){
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString("zipcode"));
				bean.setArea1(rs.getString("area1"));
				bean.setArea2(rs.getString("area2"));
				bean.setArea3(rs.getString("area3"));
				bean.setArea4(rs.getString("area4"));
				list.add(bean);
			}

		} catch (Exception e) {
			System.out.println("zipcodeRead err : " + e);
		} finally {
			try {
	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	            if (con != null) try { con.close(); } catch(SQLException ex) {}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
    
/*    public ArrayList<ZipcodeBean> zipcodeRead(String area4)  {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
		ArrayList<ZipcodeBean> list = new ArrayList<ZipcodeBean>();
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
                list.add(tempZipcode);
            }

        }catch(Exception ex) {
            System.out.println("Exception" + ex);
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null) try { con.close(); } catch(SQLException ex) {}
        }
        return list;
    }*/
    
    // findId
    public String findId(String u_name ,String u_birth) {
		
    	String u_id = null;
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    	
        try {
			con = getConnection();
		
        String strQuery = "select u_id from USERS where u_name=? and u_birth=?";
        pstmt = con.prepareStatement(strQuery);
        pstmt.setString(1, u_name);
        pstmt.setString(2, u_birth);
        
        rs = pstmt.executeQuery();
        
        if(rs.next()) {
        	u_id = rs.getString("u_id");
        }
        
        } catch (Exception e) {
			e.printStackTrace();
        }finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null) try { con.close(); } catch(SQLException ex) {}
        }
        return u_id;
    }
    
    // findPwd
    public int findPwd(String u_id, String u_name) {
    	int pwcheck = 0;  
    	 Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs= null;
                  
         try {
         	conn = getConnection();

             pstmt = conn.prepareStatement(
             "select u_pass from USERS where u_id = ? and u_name=?");
             pstmt.setString(1, u_id);
             pstmt.setString(2, u_name);
             rs = pstmt.executeQuery();
            
             /*비밀번호 맞음 1*/
             if(rs.next()){
             	pwcheck= 1; 
             }
         } catch(Exception ex) {
             ex.printStackTrace();
         } finally {
             if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
    	return pwcheck;
    }
    
    // updatePwd, 비번 찾기 후 비번 변경
    public void updatePwd(LogonDataBean users) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
       
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
            		"update USERS set u_pass=? where u_id=?");
            pstmt.setString(1, users.getU_pass());
            pstmt.setString(2, users.getU_id());
           
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    public void updatePwd(String u_id, String u_pass) {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
        
         try {
             conn = getConnection();
            
             pstmt = conn.prepareStatement(
            		 "update USERS set u_pass=? where u_id=?");
             pstmt.setString(1, u_pass);
             pstmt.setString(2, u_id);
             pstmt.executeUpdate();
             
         } catch(Exception ex) {
             ex.printStackTrace();
         } finally {
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
    }
    
    //passCheck.jsp
    public int passCheck(String u_id, String u_pass) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbpasswd="";
        int x=-1;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement(
            "select u_pass from USERS where u_id = ?");
            pstmt.setString(1, u_id);
            rs = pstmt.executeQuery();
           
            if(rs.next()){
            	dbpasswd= rs.getString("u_pass");
            	if(dbpasswd.equals(u_pass)){
                    x= 1; //인증 성공
            	}else
            		x= 0; //비밀번호 틀림
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

    
}