package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;
import manage.ManageDataBean;

public class ModifyUsersAction implements CommandAction {

	public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {
		
		request.setCharacterEncoding("utf-8");
						
		ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		
		//데이터 불러오기!
		String userid = request.getParameter("u_id");
		ManageDataBean member = dbPro.getMemberUsers(userid);
		
		request.setAttribute("u_id", member.getU_id());
		request.setAttribute("u_name", member.getU_name());
		request.setAttribute("u_pass", member.getU_pass());
		request.setAttribute("u_tel", member.getU_tel());
		request.setAttribute("u_birth", member.getU_birth());
		request.setAttribute("u_addr", member.getU_addr());
		
		//데이터 수정하기!
		String u_id = request.getParameter("u_id");
		String u_pass = request.getParameter("u_pass");
		String u_name = request.getParameter("u_name");
		String u_tel = request.getParameter("u_tel");
		String u_birth = request.getParameter("u_birth");
		String u_addr = request.getParameter("u_addr");
		String u_grade = request.getParameter("u_grade");
		
        
        
        System.out.println(request.getParameter("update"));
		String update = request.getParameter("update");
		if (update != null) {
			dbPro.updateUsers(u_id, u_pass, u_name, u_tel, u_birth, u_addr, u_grade);
			System.out.println("회원 수정 ok");
		} 
		
        
		return "/administer/ModifyUsers.jsp";
	}
}
