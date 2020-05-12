package action.SH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import teacher.WeeklyScheduleDBBean;
import teacher.WeeklyScheduleDataBean;

public class WeeklyScheduleWriteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		WeeklyScheduleDataBean ws = new WeeklyScheduleDataBean();
			ws.setWs_day(request.getParameter("ws_day"));
			ws.setSchedule(request.getParameter("schedule"));
			ws.setStarttime(request.getParameter("starttime"));
			ws.setEndtime(request.getParameter("endtime"));
			ws.setT_id(request.getSession().getAttribute("memId").toString());
		
		WeeklyScheduleDBBean dbPro = WeeklyScheduleDBBean.getInstance();
		dbPro.insertWeeklySchedule(ws);
		
		return "/Education/Teacher/teacher_Mypage.do";
	}

}
