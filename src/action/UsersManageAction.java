package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class UsersManageAction implements CommandAction {

	 public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {
		 
		 request.setCharacterEncoding("utf-8");
		 
		 String u_grade = request.getParameter("u_grade");
		 String u_id = request.getParameter("u_id");
		 String u_name = request.getParameter("u_name");
		 String u_addr = request.getParameter("u_addr");
		 String u_tel = request.getParameter("u_tel");
		 String u_birth = request.getParameter("u_birth"); 
		 
		 String t_id = request.getParameter("t_id");
		 String t_pass = request.getParameter("t_pass");
		 String t_name = request.getParameter("t_name");
		 String t_tel = request.getParameter("t_tel");
		 String t_addr = request.getParameter("t_addr");
		 String t_birth = request.getParameter("t_birth"); 
		 
		 ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		 ArrayList totalList = dbPro.getUsersList();
		 ArrayList teacherList = dbPro.getTeacherList();
		 
		 request.setAttribute("u_grade", u_grade);
	     request.setAttribute("u_id", u_id);
	     request.setAttribute("u_name", u_name);
	     request.setAttribute("u_addr", u_addr); //list.jsp의 count는 여기서 꺼내온 속성(어트리뷰트)이다.
	     request.setAttribute("u_tel", u_tel);
		 request.setAttribute("u_birth", u_birth);
		 
	     request.setAttribute("totalList", totalList);
	     request.setAttribute("teacherList", teacherList);
	       
	        return "/administer/UsersManage.jsp";//해당 뷰
	        //뷰 정보를 리턴
	 }
}
