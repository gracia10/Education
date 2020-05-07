package main_action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.MainDBBean;
import manage.ManageDBBean;

public class NoticeAction implements action.CommandAction {
    public String requestPro(HttpServletRequest request,HttpServletResponse response)  throws Throwable {

        request.setCharacterEncoding("utf-8");//�ѱ� ���ڵ�
        
        String pageNum = request.getParameter("pageNum");//������ ��ȣ
    	String search =  request.getParameter("search");
    	String string =  request.getParameter("string");
        
        if (pageNum == null) {
            pageNum = "1";
        }
        int pageSize = 6;//�� �������� ���� ����
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;//�� �������� ���۱� ��ȣ
        int endRow = currentPage * pageSize;//�� �������� ������ �۹�ȣ
        int count = 0;
        int number=0;
        
        
        List articleList = null;
        MainDBBean dbPro = MainDBBean.getInstance();//DB����
        
        
        if(search==null) { // ��ġ�� ������
        	count = dbPro.getNoticeCount(); // ��ü �� ��
        	if(count > 0) {
        		articleList = dbPro.getNoticelist(startRow, endRow);//���� �������� �ش��ϴ� �� ���
        		System.out.println("�ȵ���");
        	} else {
                articleList = Collections.EMPTY_LIST;
            }
        } else { // ��ġ�� ������
        	count = dbPro.getNoticeCount(search, string);
        	if(count > 0) {
        		articleList = dbPro.getNoticelist(startRow, endRow, search, string);
        		request.setAttribute("search1", 1);
        	}
        }
        
        number=count-(currentPage-1)*pageSize;//�۸�Ͽ� ǥ���� �۹�ȣ
        //�ش� �信�� ����� �Ӽ� �信�� �������̸� �� �¾�Ʈ����Ʈ�� �����������.
        request.setAttribute("currentPage", new Integer(currentPage)); // ��Ƽ�� �����൵ �ڵ����� �ٲ��� ��
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
        request.setAttribute("number", new Integer(number));
        request.setAttribute("articleList", articleList);
        
        request.setAttribute("string", string);
        request.setAttribute("search", search);
        
        return "/main/Notice.jsp";//�ش� ��
    }
}