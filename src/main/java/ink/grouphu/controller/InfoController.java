package ink.grouphu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ink.grouphu.bean.Info;
import ink.grouphu.serviceImpl.InfoServiceImpl;

@Controller
@RequestMapping("/info")
public class InfoController {
	@Autowired
	private InfoServiceImpl infoServiceImpl;
	@RequestMapping("/searchByHostname")
	public String toIndex(@RequestParam("hostname") String hostname,Model model) {
		System.out.println(hostname);
		Info info = infoServiceImpl.getInfoByHostname(hostname);
		model.addAttribute("info",info);
		System.out.println(info.getCpu());
		return "info";
	}
	@RequestMapping("all")
	public String toIndex(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
		
		PageInfo<Info> allInfo = infoServiceImpl.getAllInfo(pn,5);
		//PageInfo<Info> allInfo = new PageInfo<>(infos);
		model.addAttribute("allInfo",allInfo);
		return "info";
	}
	@RequestMapping("groupBy")
	public String groupBy(@RequestParam(value = "gid", defaultValue = "0") Integer gid,@RequestParam(value ="pn", defaultValue = "1")Integer pn, Model model) {
		PageInfo<Info> infoGroup = infoServiceImpl.getInfoByGroup(gid, pn, 5); //id = 1 Hu id = 2 Huang id = 3 Liu
		model.addAttribute("infoGroup",infoGroup);
		model.addAttribute("gid", gid);
		return "groupBy";
	}
	@RequestMapping("orderByCpu")
	public String orderByCpu(Model model) {
		List<Info> list = infoServiceImpl.getAllInfoOrderByCpu();
		model.addAttribute(list);
		return "orderByCpu";
	}
	@RequestMapping("index")
	public String index() {
		return "index";
	}
}
