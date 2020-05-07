package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class QnaWriteAction implements action.CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		/*String i_no = request.getParameter("i_num");
		 if (i_no == null) {
			 i_no = "1";
		 }
		int i_num = Integer.parseInt(i_no);
		String i_subject = request.getParameter("i_subject");
		String i_content = request.getParameter("i_content");
				
		MainDBBean dbPro = MainDBBean.getInstance();//DB¿¬µ¿
				
		dbPro.insert_qna(i_num,i_subject,i_content);*/
				
		return "/main/QnaWrite.jsp";
	}
}
