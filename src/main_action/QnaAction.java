package main_action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.MainDataBean;

public class QnaAction implements action.CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		MainDBBean dbPro = MainDBBean.getInstance();//DB¿¬µ¿
		ArrayList<MainDataBean> list = dbPro.getQnaList();
		
		//dbPro.insert_qna(int i_num, String i_subject, String i_content);
		//dbPro.delete_qna(int i_num);
		
		request.setAttribute("list", list);
		
		return "/main/Qna.jsp";
	}
	

}
