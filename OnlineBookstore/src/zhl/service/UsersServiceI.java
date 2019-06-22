package zhl.service;

import java.util.List;

import zhl.entity.Orders;
import zhl.entity.Users;

public interface UsersServiceI {
	/**
	   * ��id���û�����
	   * @param id
	   * @return
	   */
	  public Users oneUser(int id);
	
	
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	  public List<Users> getAllUsers();
	  
	  /**
	   * ע��/��� һ���û�
	   * @param users
	   * @return
	   */
	  public boolean addUser(Users users);
	  
	  /**
	   * ɾ��/ע��  һ���û�
	   * @param id
	   * @return
	   */
	  public boolean delUser(int id);
	  
	  /**
	   * �޸��û���Ϣ
	   * @param users
	   * @return
	   */
	  public boolean updateUser(Users users);
	  
	  /**
	   * Ψһ�û���
	   * @param name
	   * @return
	   */
	  public int  oneName(String name);
	  
	  /**
	   * Ψһ�ֻ���	
	   * @param phone
	   * @return
	   */
	  public boolean  onePhone(String phone);
	  
	  /**
	   * ��¼
	   * @param users
	   * @return
	   */
	  public Users login(Users users);
	  
	  /**
	   * �����û���ģ����ѯ
	   * @param name
	   * @return
	   */
	  public List<Users> dimName(String name);

}
