package zhl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.UsersDaoI;
import zhl.entity.Users;
import zhl.service.UsersServiceI;

@Service
public class UsersServiceImpl implements UsersServiceI{

	 @Resource
	 private UsersDaoI daoI;
	 
	public List<Users> getAllUsers() {
		return daoI.getAllUsers();
	}

	public boolean addUser(Users users) {
		//添加用户的注册时间  余额
		Date date = new Date();
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(date);
		users.setTime(time);
		users.setBalance(0);
		if(daoI.addUser(users)>0){
			return true;
		}
	    return false;
	}

	public boolean delUser(int id) {
		if(daoI.delUser(id)>0){
			return true;
		}
	    return false;
	}

	public boolean updateUser(Users users) {
		if(daoI.updateUser(users)>0){
			return true;
		}
	    return false;
	}

	public int  oneName(String name) {
		
	    return daoI.oneName(name);
	}

	public boolean  onePhone(String phone) {
		if(daoI.onePhone(phone)>0){
			return true;
		}
	    return false;
	}

	public Users login(Users users) {
		return daoI.login(users);
	}

	public List<Users> dimName(String name) {
		return daoI.dimName(name);
	}

	public Users oneUser(int id) {
		return daoI.oneUser(id);
	}

}
