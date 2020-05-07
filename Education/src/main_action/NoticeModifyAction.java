package main_action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.NoticeDataBean;
import main.NoticeLoadDataBean;
import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDBBean;

public class NoticeModifyAction implements action.CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
		int n_num = Integer.parseInt(request.getParameter("n_num"));
		String pageNum = request.getParameter("pageNum");
		
		MainDBBean dbPro = MainDBBean.getInstance();
		NoticeDataBean article = new NoticeDataBean();
		article = dbPro.getArticle(n_num);
		
		ArrayList<NoticeLoadDataBean> list_load = dbPro.getArticles_load(n_num);
		
		for(int i=0;i<list_load.size();i++) {
			String fl_subject = list_load.get(i).getNo_subject();
			String x=request.getContextPath()+"/fileSave/"+URLEncoder.encode(fl_subject,"UTF-8");
			list_load.get(i).setNo_realPath(x);
		}
		
		request.setAttribute("list_load", list_load);
		request.setAttribute("n_num", n_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return "/main/NoticeModify.jsp";
	}

}
