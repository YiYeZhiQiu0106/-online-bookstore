package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Users;

public interface UsersDaoI {
	
	
	
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
	  public int addUser(Users users);
	  
	  /**
	   * ɾ��/ע��  һ���û�
	   * @param id
	   * @return
	   */
	  public int delUser(int id);
	  
	  /**
	   * �޸��û���Ϣ
	   * @param users
	   * @return
	   */
	  public int updateUser(Users users);
	  
	  /**
	   * Ψһ�û���
	   * @param name
	   * @return
	   */
	  public int oneName(String name);
	  
	  /**
	   * Ψһ�ֻ���	
	   * @param phone
	   * @return
	   */
	  public int onePhone(String phone);
	  
	  /**
	   * ��¼
	   * @param users
	   * @return
	   */
	  public Users login(Users users);
	  
	  /**
	   * �û���ģ����ѯ
	   * @param name
	   * @return
	   */
	  public List<Users> dimName(String name);
	  
	  /**
	   * ��id���û�����
	   * @param id
	   * @return
	   */
	  public Users oneUser(int id);

}
