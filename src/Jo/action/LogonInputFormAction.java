package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;
import logon.LogonDBBean;

public class LogonInputFormAction implements action.CommandAction {// ??κ°?? ?Ό μ²λ¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?κΈ? ?Έμ½λ©

		String u_id = request.getParameter("u_id");// ?¬?©??? ₯ ??΄?
		
		LogonDBBean dbPro = LogonDBBean.getInstance();// DBμ²λ¦¬
		int check = dbPro.inputForm(u_id);

		// ?΄?Ή λ·°μ? ?¬?©?  ??±
		request.setAttribute("u_id", u_id);
		request.setAttribute("check", new Integer(check));
		
		return "/Jo/logon/inputForm.jsp";// ?΄?Ή λ·?
	}
}