//package ink.grouphu.test;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.text.MessageFormat;
//import java.util.List;
//import java.util.Properties;
//
//import javax.mail.MessagingException;
//import javax.mail.Session;
//
//import ink.grouphu.bean.Info;
//import ink.grouphu.bean.InfoExample;
//import ink.grouphu.dao.InfoMapper;
//import ink.grouphu.service.InfoService;
//import ink.grouphu.serviceImpl.AdminServiceImpl;
//import ink.grouphu.serviceImpl.InfoServiceImpl;
//import ink.grouphu.util.Mail;
//import ink.grouphu.util.MailUtil;
//
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
//
//
//import org.apache.log4j.Logger;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)     //��ʾ�̳���SpringJUnit4ClassRunner��
//@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
//
//public class TestMyBatis {
////	@Autowired
////	private InfoMapper infoMapper;
////	private static Logger logger = Logger.getLogger(TestMyBatis.class);
////	@Autowired
////	private InfoServiceImpl infoSerivce =null;
////	@Autowired
////	private AdminServiceImpl adminService;
//	@Test
//	public void test(){
//		Properties prop = new Properties();
//		try{
//			InputStream in = this.getClass().getClassLoader()
//					.getResourceAsStream("email_template.properties");
//			prop.load(in);
//		}catch(IOException e){
//			throw new RuntimeException(e);
//		}
//		String host = prop.getProperty("host");
//		String username = prop.getProperty("username");
//		String password = prop.getProperty("password");
//		Session session = MailUtil.createSession(host, username, password);
//		String from = prop.getProperty("from");
//		String to = "422593280@qq.com";
//		String subject = prop.getProperty("subject");
//		String content = "aaaaa";
//		Mail mail = new Mail(from,to,subject,content);
//		try{
//			MailUtil.send(session, mail);
//		}catch(MessagingException e){
//			throw new RuntimeException(e);
//		}catch(IOException e){
//			throw new RuntimeException(e);
//		}
//
//	}
//	public static void main(String[] args) {
//		Properties prop = new Properties();
//
//		String host ="smtp.163.com";//PropertiesReader.getProp().getProperty("host");
//		String username = "huangzongduo";//PropertiesReader.getProp().getProperty("username");
//		String password = "hero0630";//PropertiesReader.getProp().getProperty("password");
//		Session session = MailUtil.createSession(host, username, password);
//		String from = "huangzongduo@163.com";//prop.getProperty("from");
//		String to = "422593280@qq.com";
//		String subject = "\u6765\u81ea\u0059\u006f\u0073\u0065\u0062\u006f\u006f\u006b\u4e66\u57ce\u7684\u6fc0\u6d3b\u90ae\u4ef6";//prop.getProperty("subject");
//		String content = "aaaaa";
//		Mail mail = new Mail(from,to,subject,content);
//		try{
//			MailUtil.send(session, mail);
//		}catch(MessagingException e){
//			throw new RuntimeException(e);
//		}catch(IOException e){
//			throw new RuntimeException(e);
//		}
//	}
//}
//class PropertiesReader{
//	public static Properties getProp(){
//		Properties prop = new Properties();
//		//InputStream is = ScheduleRun.class.getClassLoader().getResourceAsStream("client-config.txt");
//		try{
//			File file = new File("email_template.properties");
//			InputStream is = new FileInputStream(file);
//			prop.load(is);
//
//			return prop;
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return null;
//	}
//}