package action.SH;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import student.StudentDBBean;
import teacher.TeacherDBBean;
import teacher.WeeklyScheduleDBBean;

public class TeacherMyPageAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		
		String t_id = request.getSession().getAttribute("memId").toString();
		
		List studentList = StudentDBBean.getInstance().getStudents(t_id);
		List wsList = WeeklyScheduleDBBean.getInstance().getWeeklySchedules(t_id);
		String t_name = TeacherDBBean.getInstance().getName(t_id);
		
		request.setAttribute("studentList",studentList);
		request.setAttribute("wsList",wsList);
		request.getSession().setAttribute("t_name",t_name);
		
		return "/Sunghee/Teacher/t_mypage.jsp";
	}

}
