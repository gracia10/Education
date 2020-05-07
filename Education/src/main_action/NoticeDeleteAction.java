package main_action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeDeleteAction implements action.CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("n_num", new Integer(n_num));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/main/NoticeDelete.jsp";
	}
}
