package ink.grouphu.controller;

import com.sun.deploy.net.HttpResponse;
import ink.grouphu.util.Mail;
import ink.grouphu.util.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.*;
import ink.grouphu.bean.Admin;
import ink.grouphu.serviceImpl.AdminServiceImpl;
import ink.grouphu.util.CommonUtil;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
@SessionAttributes(names = {"admin"})
public class AdminController {
	@Autowired
	AdminServiceImpl adminService;
	@RequestMapping("/claimGroup")
	public ModelAndView claimGroup(@SessionAttribute("admin") Admin admin, @RequestParam("gid")Integer gid, @RequestParam("hostname")String hostname) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("returnMessage");
		String msg;
		if(admin==null){
			System.out.println("null");
			msg = "Please Login";
			mv.addObject("msg",msg);
			return mv;
		}
		adminService.claimGroup(gid, hostname);
		msg = "Modified finished";
		mv.addObject("msg",msg);
		return mv;
	}
	
	@RequestMapping("/preRegister")
	public String preRegister() {
		return "preRegister";
	}

	@RequestMapping("/register")
	public String register(Model model,@RequestParam("username") String username,@RequestParam("password") String password,@RequestParam("email") String email) {
		Admin admin = new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		admin.setEmail(email);
		admin.setUid(CommonUtil.uuid());
		adminService.register(admin);
		model.addAttribute("admin",admin);
		return "afterRegister";
	}

	@RequestMapping("/preLogin")
	public String preLogin() {
		return "preLogin";
	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("username") String username,@RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		Admin admin = new Admin();
		admin.setUsername(username);

		admin.setPassword(password);
		String msg;
		Admin admin1 = adminService.login(admin);
		if(admin1==null){
			msg = "<a href = \"/butterfly/admin/preLogin\">请重新登陆</a>";
		}else{
			mv.addObject("admin", admin1);
			msg = "登陆成功";
		}

		mv.addObject("msg",msg);
		mv.setViewName("returnMessage");
		return mv;
	}

	@RequestMapping("/reserve")
	public ModelAndView reserve(@SessionAttribute("admin") Admin admin) {
		String msg ;
		if (admin == null) {
			msg = "<a href = \"/butterfly/admin/preLogin\">请登陆</a>";
		} else {

			Properties prop = new Properties();
			try {
				InputStream in = this.getClass().getClassLoader()
						.getResourceAsStream("email_template.properties");
				prop.load(in);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
			System.out.println(admin.getPassword());
			String host = prop.getProperty("host");
			String username = prop.getProperty("username");
			String password = prop.getProperty("password");
			Session session = MailUtil.createSession(host, username, password);
			String from = prop.getProperty("from");
			String to = admin.getEmail();
			String subject = prop.getProperty("subject");
			String content = prop.getProperty("content");
			System.out.println(host+username);

			System.out.println("host:"+host+" username:"+username+" password:"+password+" subject:"+subject+" content:"+content+" to:"+to);
			Mail mail = new Mail(from, to, subject, content);
			try {
				MailUtil.send(session, mail);
			} catch (MessagingException e) {
				throw new RuntimeException(e);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}

			msg = "预定成功";
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("returnMessage");
		mv.addObject("msg", msg);
		return mv;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest httpServletRequest, HttpServletResponse response){
//		HttpSession session = httpServletRequest.getSession();
//		session.invalidate();
//		response.setHeader("refresh","3;URL=/info/index");
		return  "logout";
	}

}
