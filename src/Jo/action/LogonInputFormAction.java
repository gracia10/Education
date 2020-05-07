package Jo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.CommandAction;
import logon.LogonDBBean;

public class LogonInputFormAction implements action.CommandAction {// ?��?���??�� ?�� 처리

	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");// ?���? ?��코딩

		String u_id = request.getParameter("u_id");// ?��?��?��?��?�� ?��?��?��
		
		LogonDBBean dbPro = LogonDBBean.getInstance();// DB처리
		int check = dbPro.inputForm(u_id);

		// ?��?�� 뷰에?�� ?��?��?�� ?��?��
		request.setAttribute("u_id", u_id);
		request.setAttribute("check", new Integer(check));
		
		return "/Jo/logon/inputForm.jsp";// ?��?�� �?
	}
}