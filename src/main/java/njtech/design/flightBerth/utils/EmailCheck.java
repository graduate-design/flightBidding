package njtech.design.flightBerth.utils;

import org.apache.commons.net.smtp.SMTPClient;
import org.apache.commons.net.smtp.SMTPReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import org.xbill.DNS.Lookup;
import org.xbill.DNS.Record;
import org.xbill.DNS.Type;
import sun.net.www.http.HttpClient;

import java.io.IOException;

public class EmailCheck {
//    https://app.verify-email.org/api/v1/z9Wgv9G17I6M5uNtcKr90xBDCRgnkttEpyqInC4bnUlvl9OBAc/2826936197@qq.com
    public static boolean checkEmail(String email) {
        RestTemplate restTemplate = new RestTemplate();
//        String key = "z9Wgv9G17I6M5uNtcKr90xBDCRgnkttEpyqInC4bnUlvl9OBAc"; // 注册后就会有key值
        String key = "Y13aWzChVrmFBZb5ZjBYs09IhxZF0M8OqKPkesJszkgpJurnMJ";
        ResponseEntity<String> result = restTemplate.getForEntity("https://app.verify-email.org/api/v1/"+key+"/verify/"
                + email,String.class);
        String resultStr = result.getBody();
        if (resultStr.contains("OK")){
            return true;
        }
        return false;
    }


}
