package action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.FileBoardDataBean;
import manage.FileBoardLoadDataBean;
import manage.ManageDBBean;


public class FileBoardContentAction implements CommandAction  {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
        request.setCharacterEncoding("utf-8");//한글 인코딩
        
        String pageNum = request.getParameter("pageNum");//페이지 번호
    	String f_nums =  request.getParameter("f_num");
    	int f_num = Integer.parseInt(f_nums);
    	
		ManageDBBean dbPro = ManageDBBean.getInstance();
		FileBoardDataBean article = dbPro.getArticle(f_num); //글 번호에 해당 되는 내용
		ArrayList<FileBoardLoadDataBean> list_load = dbPro.getArticles_load(f_num);
		
		for(int i=0;i<list_load.size();i++) {
			String fl_subject = list_load.get(i).getFl_subject();
			String x=request.getContextPath()+"/fileSave/"+URLEncoder.encode(fl_subject,"UTF-8");
			list_load.get(i).setFl_realPath(x);
		}
		request.setAttribute("article", article);
		request.setAttribute("list_load", list_load);
		request.setAttribute("pageNum", pageNum);
		
        return "/administer/FileBoardContent.jsp";
	}

}
