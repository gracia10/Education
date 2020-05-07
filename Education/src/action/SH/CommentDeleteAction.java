package action.SH;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.Diary_CommentDBBean;

public class CommentDeleteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("==================================================");
		System.out.println("[코멘트삭제Action]실행");
		
		int dc_num = Integer.parseInt(request.getParameter("dc_num"));
		
		Diary_CommentDBBean dbPro = Diary_CommentDBBean.getInstance();
		String result = dbPro.deleteComment(dc_num);
		
		request.setAttribute("result", result);
		System.out.println(">>(완료)"+ result);
		
		return "A";
	}

}
