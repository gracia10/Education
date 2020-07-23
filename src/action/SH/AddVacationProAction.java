package action.SH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import teacher.T_VacationDBBean;

public class AddVacationProAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String t_id = request.getSession().getAttribute("memId").toString();
		String vc_start = request.getParameter("vc_start");
		String vc_end = request.getParameter("vc_end");
		String reason = request.getParameter("reason");
		
		T_VacationDBBean.getInstance().insert_vacation(vc_start,vc_end,reason,t_id);


		return "/Education/Teacher/vacationList.do";
	}

}
