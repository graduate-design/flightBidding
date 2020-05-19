package njtech.design.flightBerth.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtils{
    /**
     * @param to
     *            :给谁发邮件
     * @param code
     *            ：邮件的激活码
     */
    public static void sendMail(String to, String code,String flightNum,String berthClass,double price) throws Exception {
        // 1.创建连接对象，连接到邮箱服务器
        Properties properties = new Properties();
        // 指定发送邮件的主机为 qq:smtp.qq.com  163邮箱服务器: 接收服务器pop3.163.com 发送服务器smtp.163.com
        String host = "smtp.163.com";  //QQ 邮件服务器
        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.ssl.socketFactory", sf);

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("clupinya@163.com：", "123456789LY");
            }

        });
        // 2.创建邮件对象
        Message message = new MimeMessage(session);
        // 2.1设置发件人：
        message.setFrom(new InternetAddress("liberationjurt@163.com"));
        // 2.2设置收件人：
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        // 2.3设置邮件的主题：
        message.setSubject("来自竞价升舱系统的邮件");
        // 2.4设置邮件的正文：
        message.setContent(
                "<h2>来自竞价升舱系统的邮件，恭喜您对于"+flightNum+"航班的"+berthClass+"舱位以"+price+"元竞价成功，请点击下列链接进行支付"
                        +"</h2><h4><a href='http://localhost:8888/flightberth/"
//                        + code
                        + "'>http://localhost:8888/flightberth/"
//                        + code +
                        + "</a></h4>",
                "text/html;charset=UTF-8");
        // 3.发送一封激活邮件：
        Transport.send(message);
    }

}
