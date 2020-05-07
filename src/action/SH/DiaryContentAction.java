package action.SH;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.DiaryDBBean;
import diary.DiaryDataBean;
import diary.Diary_CommentDBBean;

public class DiaryContentAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
			System.out.println("==================================================");
			System.out.println("[���̾������]����!");
		
			int d_num = Integer.parseInt(request.getParameter("d_num"));
			
			DiaryDataBean article = DiaryDBBean.getInstance().getArticle(d_num);
			
			// ��� ����Ʈ ��� 
			List commentList = Diary_CommentDBBean.getInstance().getComments(d_num);
			
						
			request.setAttribute("d_num", d_num);
			request.setAttribute("article", article);
			request.setAttribute("commentList", commentList);
			
		return "/Sunghee/Diary/diary_content.jsp";
	}

}
