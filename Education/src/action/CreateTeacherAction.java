package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class CreateTeacherAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		request.setCharacterEncoding("utf-8");

	      request.setCharacterEncoding("utf-8");
	      
	      String t_id = request.getParameter("t_id");
	      String t_pass = request.getParameter("t_pass");
	      String t_name = request.getParameter("t_name");
	      String t_tel = request.getParameter("t_tel");
	      String t_birth = request.getParameter("t_birth");
	      String zipcode = request.getParameter("zipcode");
	      String t_addr = request.getParameter("t_addr");
	      
	      ManageDBBean dbPro = ManageDBBean.getInstance();
	      dbPro.insert_teacher(t_id, t_pass, t_name, t_tel, t_birth, t_addr, zipcode);
	     
		return "/administer/CreateTeacher.jsp";
	}
}
