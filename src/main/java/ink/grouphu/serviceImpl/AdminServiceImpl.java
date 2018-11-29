package ink.grouphu.serviceImpl;

import java.util.ArrayList;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ink.grouphu.bean.Admin;
import ink.grouphu.bean.AdminExample;
import ink.grouphu.bean.Info;
import ink.grouphu.bean.InfoExample;
import ink.grouphu.dao.AdminMapper;
import ink.grouphu.dao.InfoMapper;
import ink.grouphu.service.AdminService;
import ink.grouphu.util.CommonUtil;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private InfoMapper infoMapper;
	@Autowired
	private AdminMapper adminMapper;
	
	public boolean claimGroup(Integer gid, String hostname) {
		System.out.println(1);
		Info info = new Info();
		info.setGid(gid);
		info.setHostname(hostname);
		infoMapper.updateByPrimaryKeySelective(info);
		System.out.println(0);
		return false;
	}

	public int register(Admin admin) {
		// TODO Auto-generated method stub
		admin.setUid(CommonUtil.uuid());
		return adminMapper.insert(admin);
	}
	
	public Admin login(Admin admin) {

		Admin admin1 = adminMapper.selectByPrimaryKey(admin.getUsername());
		if(admin1.getPassword().equals(admin.getPassword()))
			return admin1;
		return null;
	}
}
