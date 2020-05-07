package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class ConsultManageAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		String u_grade = request.getParameter("u_grade");

		ManageDBBean dbPro = ManageDBBean.getInstance();// DB¿¬µ¿
		ArrayList consultList = dbPro.getConsultList();

		request.setAttribute("consultList", consultList);

		return "/administer/ConsultManage.jsp";
	}
}
