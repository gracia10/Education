package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class StudentManageAction implements CommandAction {
	public String requestPro(HttpServletRequest request,HttpServletResponse response)throws Throwable {
	
		String s_no = request.getParameter("s_no");
		 if (s_no == null) {
	            s_no = "1";
	        }
		int s_num = Integer.parseInt(s_no);
		
		System.out.println("이건 StudentManage의 s_num"+s_num);
		//이거 왜 1나오냐 ㅋㅋ..?
		
		String s_name = request.getParameter("s_name");
		String s_birth= request.getParameter("s.s_birth"); //타임스탬프
		String s_tel= request.getParameter("s.s_tel");
		String t_id= request.getParameter("t.t_id");
		String u_id = request.getParameter("u.u_id");
		String u_grade= request.getParameter("u.u_grade");
		String u_addr = request.getParameter("u.u_addr");
		String t_name = request.getParameter("t.t_name");
		String u_name = request.getParameter("u.u_name");
		
		 
		 ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		 ArrayList totalList = dbPro.getStudentList();
		 
		 request.setAttribute("s.s_num", s_num);
		 request.setAttribute("s.s_name", s_name);
		 request.setAttribute("s.s_birth", s_birth);
		 request.setAttribute("s.s_tel", s_tel);
		 request.setAttribute("t.t_id", t_id);
		 request.setAttribute("u.u_id", u_id);
		 request.setAttribute("u.u_grade", u_grade);
		 request.setAttribute("u.u_addr", u_addr);
		 request.setAttribute("t.t_name", t_name);
		 request.setAttribute("u.u_name", u_name); 
	     	     
	     request.setAttribute("totalList", totalList);

		return "/administer/StudentManage.jsp";//해당 뷰
	}
}
