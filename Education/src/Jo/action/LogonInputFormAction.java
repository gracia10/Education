package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;
import logon.LogonDBBean;

public class LogonInputFormAction implements action.CommandAction {// ?šŒ?›ê°??… ?¼ ì²˜ë¦¬

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?•œê¸? ?¸ì½”ë”©

		String u_id = request.getParameter("u_id");// ?‚¬?š©??…? ¥ ?•„?´?””
		
		LogonDBBean dbPro = LogonDBBean.getInstance();// DBì²˜ë¦¬
		int check = dbPro.inputForm(u_id);

		// ?•´?‹¹ ë·°ì—?„œ ?‚¬?š©?•  ?†?„±
		request.setAttribute("u_id", u_id);
		request.setAttribute("check", new Integer(check));
		
		return "/Jo/logon/inputForm.jsp";// ?•´?‹¹ ë·?
	}
}