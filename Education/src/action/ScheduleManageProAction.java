package action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class ScheduleManageProAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
        request.setCharacterEncoding("utf-8");//한글 인코딩
		
        String snum = request.getParameter("vacation_num");
        int num = Integer.parseInt(snum);
        String what = request.getParameter("what");
        
        ManageDBBean dbPro = ManageDBBean.getInstance();//DB처리
        
        if(what.equals("admit")) {
        	
            Date a[] = dbPro.get_vc_start_end(num);
            String t_id = dbPro.get_t_id(num);
            int b = (int) (a[1].getTime()-a[0].getTime()) / (1000*3600*24);
            
            for(int i=0; i<=b ; i++) {
            	Long nal = a[0].getTime() + i*1000*3600*24;
            	DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            	Date date = new Date(nal);
            	String date2 = df.format(date);
            	dbPro.insert_schedule(date2, num, t_id);
            }
        }
        
        dbPro.deleteVacation(num);
        
		return "/administer/ScheduleManagePro.jsp";
	}

}
