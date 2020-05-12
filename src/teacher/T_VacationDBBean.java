package teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import manage.ManageDBBean;

public class T_VacationDBBean {
	
	private static T_VacationDBBean instance = new T_VacationDBBean();

	public static T_VacationDBBean getInstance() {
		return instance;
	}

	private T_VacationDBBean() {
	}

	private Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		return DriverManager.getConnection(jdbcDriver);
	}

    public void insert_vacation(String start, String end, String reason,String id) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int x=0;
        
        try {
        	conn = getConnection();

            pstmt = conn.prepareStatement("insert into vacation values(seq_vc_num.nextval,?,?,?,?)");
            pstmt.setString(1, id);
            pstmt.setString(2, start);
            pstmt.setString(3, end);
            pstmt.setString(4, reason);
            x = pstmt.executeUpdate();
            
            conn.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        System.out.println("[완료]-디비에 갔을까 ::"+x);
    }
}

