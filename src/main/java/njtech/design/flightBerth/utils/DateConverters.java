package njtech.design.flightBerth.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateConverters {

    public static Date dateConverter(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String toDate = sdf.format(date);
//        System.out.println(toDate);

        //使用SimpleDateFormat的parse()方法生成Date
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = null;
        try {
            date1 = sdf1.parse(toDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        //打印Date
        System.out.println(date1);
        return date1;


    }

}
