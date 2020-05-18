package njtech.design.flightBerth.task;

import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.service.FlightService;
import njtech.design.flightBerth.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.xml.crypto.Data;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Component
public class TimeTask {

    @Autowired
    private FlightService flightService;

    @Autowired
    private PriceService priceService;

//    @Scheduled(cron = "0 0/1 * * * ? ") // 每分钟执行一次
    @Scheduled(fixedDelay = 1000*60)
    public void taskCycle() {
        //定时设置航班起飞的前一天 关闭该航班的竞价信息
        /**
         * 1.航班信息的del_flag置为1
         * 2.总结航班的竞价排名，发送短信告知，并升级舱位
         * 3.将购买该航班的用户的ticket信息的remark记为"已过期"
         *
         */
//        System.out.print(new Date()+"    ");
        List<Flight> flights =  flightService.solveExpiredFlight();


    }
}
