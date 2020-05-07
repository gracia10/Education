package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileBoardDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
		int f_num = Integer.parseInt(request.getParameter("f_num"));
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("f_num", new Integer(f_num));
		request.setAttribute("pageNum", new Integer(pageNum));
		
		return "/administer/FileBoardDelete.jsp";
	}
}
