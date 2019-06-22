package zhl.service;

import java.util.List;

import zhl.entity.Booktype;

public interface BooktypeServiceI {
	
	/**
	   * ������ģ����ѯ
	   * @param name
	   * @return
	   */
	  public List<Booktype> dimName(String name);
	
	
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
}
