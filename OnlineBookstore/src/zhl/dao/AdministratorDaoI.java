package zhl.dao;

import org.springframework.stereotype.Repository;

import zhl.entity.Administrator;

public interface AdministratorDaoI {
	
	/**
	 * ����Ա��¼
	 * @param a_idNumber
	 * @param pwd
	 * @return
	 */
	public Administrator longin(String a_idNumber,String a_pwd);
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @return
	 */
	public int updateAdm(Administrator adm);

}
