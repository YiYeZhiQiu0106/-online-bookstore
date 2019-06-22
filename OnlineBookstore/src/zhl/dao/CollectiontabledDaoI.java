package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Collectiontable;

public interface CollectiontabledDaoI {  
	
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
	public int addCollection(Collectiontable c);
	
	
	/**
	 * �û����ղ�ͼ��ɾ��
	 * @param u_id
	 * @param b_id
	 * @return
	 */
	public int delCollection(int c_id);

}
