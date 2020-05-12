package diary;

import java.sql.Timestamp;

public class Diary_CommentDataBean {

	private int d_num;
	private int dc_num;
	private String dc_content;
	private Timestamp dc_reg_date;
	private String commenter;
	
	
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getDc_num() {
		return dc_num;
	}
	public void setDc_num(int dc_num) {
		this.dc_num = dc_num;
	}
	public String getDc_content() {
		return dc_content;
	}
	public void setDc_content(String dc_content) {
		this.dc_content = dc_content;
	}
	public Timestamp getDc_reg_date() {
		return dc_reg_date;
	}
	public void setDc_reg_date(Timestamp dc_reg_date) {
		this.dc_reg_date = dc_reg_date;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	

	@Override
    public String toString() {
        return "'d_num'=" + d_num + ", 'dc_num'=" + dc_num + ", 'dc_num'=" + dc_num + ", 'dc_content'=" + dc_content
                + ", 'dc_reg_date'=" + dc_reg_date+ ", 'commenter'=" + commenter;
    }


}
