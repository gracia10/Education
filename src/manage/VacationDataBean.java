package manage;

public class VacationDataBean {
	int vc_num;
	String vc_start;
	String vc_end;
	String t_name;
	String vc_reason;
	
	public int getVc_num() {
		return vc_num;
	}
	public String getVc_start() {
		return vc_start;
	}
	public void setVc_start(String vc_start) {
		this.vc_start = vc_start;
	}
	public String getVc_end() {
		return vc_end;
	}
	public void setVc_end(String vc_end) {
		this.vc_end = vc_end;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getVc_reason() {
		return vc_reason;
	}
	public void setVc_reason(String vc_reason) {
		this.vc_reason = vc_reason;
	}
	public void setVc_num(int vc_num) {
		this.vc_num = vc_num;
	}	
}
