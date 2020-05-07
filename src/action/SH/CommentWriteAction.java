package action.SH;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import diary.Diary_CommentDBBean;
import diary.Diary_CommentDataBean;

public class CommentWriteAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		Diary_CommentDataBean comment = new Diary_CommentDataBean();
		comment.setD_num(Integer.parseInt(request.getParameter("d_num")));
		comment.setDc_content(request.getParameter("dc_content"));
		comment.setCommenter(request.getSession().getAttribute("memId").toString());
		comment.setDc_reg_date(new Timestamp(System.currentTimeMillis()));
		
		String result = Diary_CommentDBBean.getInstance().insertComment(comment);
		request.setAttribute("result", result);
		
		return  "AjaxCall";
	}

}
