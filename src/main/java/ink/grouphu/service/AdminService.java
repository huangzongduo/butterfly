package ink.grouphu.service;

import ink.grouphu.bean.Admin;

public interface AdminService {
	public boolean claimGroup(Integer gid,String hostname);
	public int register(Admin admin);
}
