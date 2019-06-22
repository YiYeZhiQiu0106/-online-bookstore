package zhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Orders;

public interface OrdersDaoI {
	
	/**
	 * ��ѯ�����ѷ�������
	 * @return
	 */
	public List<Orders> getAllOrders1();
	
	/**
	 * ��ѯ����δ��������
	 * @return
	 */
	public List<Orders> getAllOrders();
	
	/**
	 * ����(�ı�״̬)
	 * @return
	 */
	public int alterState(int o_id);
	
	/**
	 * ��������
	 * @param orders
	 * @return
	 */
	public int addOrders(Orders orders); 
	
	/**
	 * �޸�
	 * @return
	 */
	public int updateOrders(Orders orders);
	
	
	/**
	 * ȡ������
	 * @param o_id
	 * @return
	 */
	public int delOrders(int o_id);
	
	
	/**
	 * ��ѯ�����û������ж���
	 * @param u_id
	 * @return
	 */
	public List<Orders> getUserOrders(int u_id);
	
	/**
	 * ����+1
	 * @param b_id
	 * @return
	 */
	public int addOne(int b_id);
	
	/**
	 * ����-1
	 * @param b_id
	 * @return
	 */
	public int minusOne(int b_id);
	
	
	/**
	 * ģ����ѯ������
	 * @param o_id
	 * @return
	 */
	public List<Orders> dimO_id(int o_id,int sta);

}
