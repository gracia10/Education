package action.SH;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import manage.ManageDBBean;
import teacher.T_VacationDBBean;

public class AddVacationProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("===========================================");
		System.out.println("[베케이션프로 액션]실행!"+request.getSession().getAttribute("memId").toString());
		
		
		request.setCharacterEncoding("utf-8");// 한글 인코딩

		String t_id = request.getSession().getAttribute("memId").toString();
		String vc_start = request.getParameter("vc_start");
		String vc_end = request.getParameter("vc_end");
		String reason = request.getParameter("reason");
		
		T_VacationDBBean.getInstance().insert_vacation(vc_start,vc_end,reason,t_id);


		return "/Sunghee/Teacher/vacationPro.jsp";
	}

}
