package student;

import java.time.LocalDate;

public class StudentDataBean {

	private int s_no;
	private String s_name;
	private LocalDate s_birth;
	private int s_tel;
	private String t_id;
	private String u_id;
	private String u_grade;
	private String s_img;
	
	public int getS_no() {
		return s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public LocalDate getS_birth() {
		return s_birth;
	}
	public int getS_tel() {
		return s_tel;
	}
	public String getT_id() {
		return t_id;
	}
	public String getU_id() {
		return u_id;
	}
	public String getU_grade() {
		return u_grade;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public void setS_birth(LocalDate s_birth) {
		this.s_birth = s_birth;
	}
	public void setS_tel(int s_tel) {
		this.s_tel = s_tel;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	
	
}
