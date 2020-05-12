package manage;

import java.sql.Timestamp;

public class FileBoardDataBean {
	int f_num;
	String f_subject;
	String f_pass;
	String f_content;
	Timestamp f_date;
	String t_name;
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_subject() {
		return f_subject;
	}
	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}
	public String getF_pass() {
		return f_pass;
	}
	public void setF_pass(String f_pass) {
		this.f_pass = f_pass;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public Timestamp getF_date() {
		return f_date;
	}
	public void setF_date(Timestamp f_date) {
		this.f_date = f_date;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	
}
