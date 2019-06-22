package zhl.service;

import zhl.entity.Administrator;

public interface AdministratorServiceI {
	
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
	public boolean updateAdm(Administrator adm);


}
