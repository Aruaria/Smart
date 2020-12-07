package com.smart.Daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.smart.Beans.Admin;
import com.smart.Dao.AdminDao;
import com.smart.Util.DBUtil;

public class AdminDaoimpl implements AdminDao{
	DBUtil db = new DBUtil();
	ResultSet rs = null;
	
	
	@Override
	public boolean addAdmin(Admin admin) {
		String sql = "insert into admin value(?,?,?)";
		Object[] params = new Object[]{admin.getAdminId(),admin.getAdminName(),admin.getAdminPwd()};
		boolean s = db.executeUpdate(sql, params);
		return s;
	}

	@Override
	public boolean deleteAdmin(String adminId) {
		String sql = "delete from admin where adminId = ?";
		Object[] params = new Object[]{adminId};
		boolean s = db.executeUpdate(sql, params);
		return s;
	}

	@Override
	public boolean updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Admin checkUserNameAndPwd(String id, String pwd) {
		String sql = "select * from admin where adminId = ? and adminPwd = ?";
		Object[] params = new Object[]{id,pwd};
		rs = db.executeQuery(sql, params);
		try {
			if(rs.next()){
				//说明用户名和密码正确,取出对象
				Admin ad = new Admin();
				ad.setAdminId(rs.getString("adminId"));
				ad.setAdminName(rs.getString("adminName"));
				ad.setAdminPwd(rs.getString("adminPwd"));
				return ad;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Admin> getAllAdmin() {
		String sql = "select * from admin";
		List<Admin> list = new ArrayList<Admin>();
//		Object[] params = new Object[]{null};
		rs = db.executeQuery(sql, null);
		try {
			while(rs.next()){
				//说明用户名和密码正确,取出对象
				Admin ad = new Admin();
				ad.setAdminId(rs.getString("adminId"));
				ad.setAdminName(rs.getString("adminName"));
				ad.setAdminPwd(rs.getString("adminPwd"));
				list.add(ad);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateAdmin(String NewadminId, String adminName, String adminPwd,String OldadminId) {
		String sql = "update admin set adminId = ?,adminName = ?,adminPwd = ? where adminId = ?";
		Object[] params = new Object[]{NewadminId,adminName,adminPwd,OldadminId};
		boolean t = db.executeUpdate(sql, params);
		return t;
	}

	@Override
	public boolean isExist(String adminId) {
		String sql = "select * from admin where adminId = ?";
		Object[] params = new Object[]{adminId};
		rs = db.executeQuery(sql, params);
		try {
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}


}
