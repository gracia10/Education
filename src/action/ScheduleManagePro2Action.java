package action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manage.ManageDBBean;

public class ScheduleManagePro2Action implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");// 한글 인코딩

		String holiday_name = request.getParameter("holiday_name");
		String holiday_start = request.getParameter("holiday_start");
		String holiday_end = request.getParameter("holiday_end");
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date a[] = new Date[2];
		a[0] = sdFormat.parse(holiday_start);
		a[1] = sdFormat.parse(holiday_end);

		ManageDBBean dbPro = ManageDBBean.getInstance();// DB처리

		int b = (int) (a[1].getTime() - a[0].getTime()) / (1000 * 3600 * 24);

		int x = dbPro.get_seq_vc_num();

		for (int i = 0; i <= b; i++) {
			Long nal = a[0].getTime() + i * 1000 * 3600 * 24;
			DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date(nal);
			String date2 = df.format(date);
			dbPro.insert_schedule2(date2, x);
		}

		dbPro.insert_holiday(x, holiday_name, holiday_start, holiday_end);

		return "/administer/ScheduleManagePro.jsp";
	}

}
