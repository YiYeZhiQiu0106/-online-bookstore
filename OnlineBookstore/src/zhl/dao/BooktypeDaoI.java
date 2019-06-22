package zhl.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Booktype;
import zhl.entity.Users;

public interface BooktypeDaoI {
	/**
	 * ��ѯ��������
	 * @return
	 */
	public List<Booktype> getAllType();
	
	/**
	 * ���һ������
	 * @param booktype
	 * @return
	 */
	public int addType(Booktype booktype);
	
	/**
	 * ɾ������
	 * @param bt_id
	 * @return
	 */
	public int deleteType(int bt_id);
	
	/**
	 * �޸�
	 * @param booktype
	 * @return
	 */
	public int updateType(Booktype booktype);
	
	/**
	 * �ж�һ�������Ƿ����
	 * @param bt_name
	 * @return
	 */
	public int oneType(String bt_name);
	
	/**
	   * ������ģ����ѯ
	   * @param name
	   * @return
	   */
	  public List<Booktype> dimName(String name);
		

}
