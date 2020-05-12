package diary;

import java.sql.Timestamp;

public class DiaryDataBean {

	private int d_num;
	private int d_yy;
	private int d_mm;
	private int d_dd;
	private String d_subject;
	private String d_content;
	private Timestamp d_date;
	private int s_no;
	
	public int getD_num() {
		return d_num;
	}
	public int getD_yy() {
		return d_yy;
	}
	public int getD_mm() {
		return d_mm;
	}
	public int getD_dd() {
		return d_dd;
	}
	public String getD_subject() {
		return d_subject;
	}
	public String getD_content() {
		return d_content;
	}
	public Timestamp getD_date() {
		return d_date;
	}
	public int getS_no() {
		return s_no;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public void setD_yy(int d_yy) {
		this.d_yy = d_yy;
	}
	public void setD_mm(int d_mm) {
		this.d_mm = d_mm;
	}
	public void setD_dd(int d_dd) {
		this.d_dd = d_dd;
	}
	public void setD_subject(String d_subject) {
		this.d_subject = d_subject;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public void setD_date(Timestamp d_date) {
		this.d_date = d_date;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
}
