package teacher;

import java.time.LocalTime;

public class WeeklyScheduleDataBean {

	private int ws_num;
	private String ws_day;
	private String schedule;
	private String starttime;
	private String endtime;
	private String t_id;
	
	public int getWs_num() {
		return ws_num;
	}
	public String getWs_day() {
		return ws_day;
	}
	public String getSchedule() {
		return schedule;
	}
	public String getStarttime() {
		return starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public String getT_id() {
		return t_id;
	}
	public void setWs_num(int ws_num) {
		this.ws_num = ws_num;
	}
	public void setWs_day(String ws_day) {
		this.ws_day = ws_day;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	
}
