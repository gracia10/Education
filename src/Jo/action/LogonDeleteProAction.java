package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logon.LogonDBBean;
import action.CommandAction;

public class LogonDeleteProAction implements action.CommandAction {// ?��?��?��?�� 처리

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");

		LogonDBBean dbPro = LogonDBBean.getInstance();
		int check = dbPro.deleteUsers(u_id, u_pass);

		// ?��?�� 뷰에?�� ?��?��?�� ?��?��
		request.setAttribute("check", new Integer(check));

		return "/Jo/logon/deletePro.jsp";// ?��?���?
	}
}