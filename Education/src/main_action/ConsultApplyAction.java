package main_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class ConsultApplyAction implements action.CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");

		String t_id = request.getParameter("t_id");
		String date = request.getParameter("c_date");
		String name = request.getParameter("c_name");
		String tel = request.getParameter("c_tel");
		String time = request.getParameter("c_time");
		String service = request.getParameter("c_service");
		
		
		MainDBBean dbPro = MainDBBean.getInstance();//DB연동
	
		String update = request.getParameter("update");
	if (update != null) {
		dbPro.insert_consult(date, name, tel, time, service, t_id);
		System.out.println("잘 실행됐음.");
	} 
	
	request.setAttribute("t_id", t_id);
	
	return "/main/ConsultApply.jsp";
	}
}
