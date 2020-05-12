package main;

import java.sql.Timestamp;

public class NoticeDataBean {
	int n_num;
	String n_subject;
	String n_content;
	int n_readcount;
	Timestamp n_reg_date;
	
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_readcount() {
		return n_readcount;
	}
	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	public Timestamp getN_reg_date() {
		return n_reg_date;
	}
	public void setN_reg_date(Timestamp n_reg_date) {
		this.n_reg_date = n_reg_date;
	}
}
