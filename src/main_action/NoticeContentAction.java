package main_action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import main.NoticeLoadDataBean;
import main.NoticeDataBean;
import manage.ManageDBBean;


public class NoticeContentAction implements action.CommandAction  {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String pageNum = request.getParameter("pageNum");//페이지 번호
    	String n_nums =  request.getParameter("n_num");
    	int n_num = Integer.parseInt(n_nums);
    	
		MainDBBean dbPro = MainDBBean.getInstance();
		NoticeDataBean article = dbPro.getArticle(n_num); //글 번호에 해당 되는 내용
		ArrayList<NoticeLoadDataBean> list_load = dbPro.getArticles_load(n_num);
		
		for(int i=0;i<list_load.size();i++) {
			String fl_subject = list_load.get(i).getNo_subject();
			String x=request.getContextPath()+"/noticeSave/"+URLEncoder.encode(fl_subject,"UTF-8");
			list_load.get(i).setNo_realPath(x);
		}
		request.setAttribute("article", article);
		request.setAttribute("list_load", list_load);
		request.setAttribute("pageNum", pageNum);
		
        return "/main/NoticeContent.jsp";
	}

}
