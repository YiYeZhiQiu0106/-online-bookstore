package zhl.service;

import java.util.List;

import zhl.entity.Collectiontable;

public interface CollectiontableServiceI {
	
	/**
	 * �û��ĸ��������ղ�
	 * @param u_id
	 * @return
	 */
	public List<Collectiontable> userCollection(int u_id);
	
	
	/**
	 * �û���ͼ����뵽�ղ�
	 * @param c
	 * @return
	 */
	public boolean addCollection(Collectiontable c);
	
	
	/**
	 * �û����ղ�ͼ��ɾ��
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public boolean delCollection(int c_id);

}
