package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class DeleteConsultAction implements CommandAction {
	public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {
		request.setCharacterEncoding("utf-8");//한글 인코딩
		
		String consult_num = request.getParameter("c_num");
		System.out.println("consult_num : "+ consult_num);
		
		 if (consult_num == null) {
	            consult_num = "1";
	        }
		int c_num = Integer.parseInt(consult_num);
		
		System.out.println("이건 상담delte액션의 c_num"+c_num);
		
		ManageDBBean dbPro = ManageDBBean.getInstance();
		dbPro.deleteConsult(c_num);
		
		
		return "/administer/ConsultManagePro.jsp";
	}
}
