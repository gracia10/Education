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
		
		
		System.out.println("==================================================");
		System.out.println("[코멘트 추가]실행!"+request.getParameter("dc_content"));
		
		Diary_CommentDataBean comment = new Diary_CommentDataBean();
		comment.setD_num(Integer.parseInt(request.getParameter("d_num")));
		comment.setDc_content(request.getParameter("dc_content"));
		comment.setCommenter(request.getSession().getAttribute("memId").toString());
		comment.setDc_reg_date(new Timestamp(System.currentTimeMillis()));
		
		
		String result = Diary_CommentDBBean.getInstance().insertComment(comment);
		request.setAttribute("result", result);
		
		System.out.println(">>(완료)"+result);
		return  "A";
	}

}
