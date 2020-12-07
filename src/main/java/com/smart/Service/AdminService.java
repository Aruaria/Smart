package com.smart.Service;

import java.util.List;

import com.smart.Beans.Admin;

public interface AdminService {
		//添加管理员
		public boolean addAdmin(Admin admin);
		//删除单个管理员
		public boolean deleteAdmin(String adminId);
		//修改单个管理员
		public boolean updateAdmin(Admin admin);
		//查询单个管理员
		public Admin checkUserNameAndPwd(String id,String pwd);
		//查询所有管理员
		public List<Admin> getAllAdmin();
		//修改管理员信息
		public boolean updateAdmin(String adminId,String adminName,String adminPwd,String OldadminId);
		//判断管理员是否存在
		public boolean isExist(String adminId);
}
