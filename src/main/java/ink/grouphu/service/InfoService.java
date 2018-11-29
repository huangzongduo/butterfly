package ink.grouphu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import ink.grouphu.bean.Info;



public interface InfoService {
	public Info getInfoByHostname(String hostname);
	public PageInfo<Info> getAllInfo(Integer pn,Integer pageSize);
	public List<Info> getAllInfoOrderByCpu();
	public PageInfo<Info> getInfoByGroup(Integer gid,Integer pn, Integer pageSize);
}
