package vn.edu.hcmuaf.fit.Database;

import java.io.IOException;
import java.util.Properties;

public class MailProperties {
    private static final Properties prop = new Properties();

    static {
        try {
            prop.load(MailProperties.class.getClassLoader().getResourceAsStream("email.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static Properties getSMTPPro() {
        Properties pro = new Properties();
        pro.put("mail.smtp.host", getMailHost());
        pro.put("mail.smtp.port", getMailPort());
        pro.put("mail.smtp.auth", getMailAuth());
        pro.put("mail.smtp.starttls.enable", getMailStarttls());
        return pro;
    }
    public static String getMailHost(){
        return  prop.getProperty("mail.smtp.host").toString();
    }
    public static String getMailPort(){
        return  prop.getProperty("mail.smtp.port").toString();
    }
    public static String getMailAuth(){
        return  prop.getProperty("mail.smtp.auth").toString();
    }
    public static String getMailStarttls(){
        return  prop.getProperty("mail.smtp.starttls.enable").toString();
    }
    public static String getMailUsername(){
        return  prop.getProperty("mail.username").toString();
    }
    public static String getMailPassword(){
        return  prop.getProperty("mail.password").toString();
    }
    public static String getMailFrom(){
        return  prop.getProperty("mail.from").toString();
    }
    public static String getMailName(){
        return  prop.getProperty("mail.name").toString();
    }
}
