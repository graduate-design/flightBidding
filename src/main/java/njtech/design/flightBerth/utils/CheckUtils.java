package njtech.design.flightBerth.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CheckUtils {
    public static boolean isMobileNO(String mobiles) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        return m.matches();
    }

    public static boolean isChinese(String name){

            Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
            Matcher m = p.matcher(name);
            if (m.find()) {
                return true;
            }
            return false;

    }

}
