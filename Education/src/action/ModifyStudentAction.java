package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;
import manage.ManageStudentDataBean;

public class ModifyStudentAction implements CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");// 한글 인코딩

		String s_num = request.getParameter("s_no");
		System.out.println("student_no : "+ s_num);
		
		 if (s_num == null) {
	            s_num = "1";
	        }
		int s_no = Integer.parseInt(s_num);
		
		ManageDBBean dbPro = ManageDBBean.getInstance();//DB연동
		
		// 데이터 불러오기!		
		ManageStudentDataBean student = dbPro.getMemberStudent(s_no);

		request.setAttribute("s_no", student.getS_no());
		request.setAttribute("s_name", student.getS_name());
		request.setAttribute("s_tel", student.getS_tel());
		request.setAttribute("s_birth", student.getS_birth());
		request.setAttribute("u_id", student.getU_id());
		request.setAttribute("t_id", student.getT_id());
		
		return "/administer/ModifyStudent.jsp";
	}
}
