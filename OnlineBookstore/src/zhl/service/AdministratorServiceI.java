package zhl.service;

import zhl.entity.Administrator;

public interface AdministratorServiceI {
	
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
	public boolean updateAdm(Administrator adm);


}
