package com.smart.Serviceimpl;

import java.util.List;

import com.smart.Beans.Admin;
import com.smart.Dao.AdminDao;
import com.smart.Daoimpl.AdminDaoimpl;
import com.smart.Service.AdminService;

public class AdminServiceimpl implements AdminService {
	AdminDao ad = new AdminDaoimpl();
	@Override
	public boolean addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return ad.addAdmin(admin);
	}

	@Override
	public boolean deleteAdmin(String adminId) {
		// TODO Auto-generated method stub
		return ad.deleteAdmin(adminId);
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Admin checkUserNameAndPwd(String id, String pwd) {
		
		return ad.checkUserNameAndPwd(id, pwd);
	}

	@Override
	public List<Admin> getAllAdmin() {
		return ad.getAllAdmin();
	}

	@Override
	public boolean updateAdmin(String adminId, String adminName, String adminPwd, String OldadminId) {
		// TODO Auto-generated method stub
		return ad.updateAdmin(adminId, adminName, adminPwd, OldadminId);
	}

	@Override
	public boolean isExist(String adminId) {
		return ad.isExist(adminId);
	}


}
