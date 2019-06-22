package zhl.dao;

import org.springframework.stereotype.Repository;

import zhl.entity.Administrator;

public interface AdministratorDaoI {
	
	/**
	 * 管理员登录
	 * @param a_idNumber
	 * @param pwd
	 * @return
	 */
	public Administrator longin(String a_idNumber,String a_pwd);
	
	/**
	 * 修改管理员信息
	 * @return
	 */
	public int updateAdm(Administrator adm);

}
