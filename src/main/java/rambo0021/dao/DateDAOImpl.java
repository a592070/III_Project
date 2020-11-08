package rambo0021.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDAOImpl implements DateDao {

   @Override
   public Date StringtoDate(String date){
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    try {
			return sdf.parse(date);
		} catch (ParseException e) {
			System.out.println("日期格式錯誤");
			e.printStackTrace();
			return new Date();
		}
   }
}
