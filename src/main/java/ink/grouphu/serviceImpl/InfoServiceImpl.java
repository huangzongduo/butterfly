package ink.grouphu.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ink.grouphu.bean.Info;
import ink.grouphu.bean.InfoExample;
import ink.grouphu.dao.InfoMapper;
import ink.grouphu.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	private InfoMapper infoMapper = null;

	
	public PageInfo<Info> getAllInfo(Integer pn,Integer pageSize) {
		// TODO Auto-generated method stub
		InfoExample example = new InfoExample();
		example.setOrderByClause("cpu ASC");
		example.createCriteria().andCpuGreaterThanOrEqualTo("0");
		PageHelper.startPage(pn,pageSize);
		List<Info> info = infoMapper.selectByExample(example);
		PageInfo<Info> page = new PageInfo<Info>(info, pageSize);
		return page;
	}

	
	public Info getInfoByHostname(String hostname) {
		// TODO Auto-generated method stub
		Info info = infoMapper.selectByPrimaryKey(hostname);
		return info;
	}


	public List<Info> getAllInfoOrderByCpu() {
		// TODO Auto-generated method stub
		InfoExample example = new InfoExample();
		example.setOrderByClause("cpu ASC");
		List<Info> info = infoMapper.selectByExample(example);
		return info;
		
	}


	public PageInfo<Info> getInfoByGroup(Integer gid,Integer pn, Integer pageSize) {
		// TODO Auto-generated method stub
		InfoExample example = new InfoExample();
		if(gid!=0)
			example.createCriteria().andGidEqualTo(gid);
		example.setOrderByClause("cpu ASC");
		PageHelper.startPage(pn,pageSize);
		List<Info> info = infoMapper.selectByExample(example);
		PageInfo<Info> page = new PageInfo<Info>(info);
		return page;
	}
	
	

	
	

}
