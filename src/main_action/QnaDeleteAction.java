package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class QnaDeleteAction implements action.CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String i_no = request.getParameter("i_num");
		 if (i_no == null) {
			 i_no = "1";
		 }
		int i_num = Integer.parseInt(i_no);
		
		MainDBBean dbPro = MainDBBean.getInstance();//DB연동
		System.out.println("넘어오니 넘버(delete)"+i_num);
		dbPro.delete_qna(i_num);
				
		return "/main/QnaDelete.jsp";
	}
}
