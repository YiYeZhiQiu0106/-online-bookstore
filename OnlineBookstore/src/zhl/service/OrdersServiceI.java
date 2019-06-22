package zhl.service;

import java.util.List;

import zhl.entity.Orders;

public interface OrdersServiceI {
	
	
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
	public boolean alterState(int o_id);
	
	/**
	 * ��������
	 * @param orders
	 * @return
	 */
	public boolean addOrders(Orders orders); 
	
	/**
	 * �޸�
	 * @return
	 */
	public boolean updateOrders(Orders orders);
	
	
	/**
	 * ȡ������
	 * @param o_id
	 * @return
	 */
	public boolean delOrders(int o_id);
	
	
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
	public boolean addOne(int b_id);
	
	/**
	 * ����-1
	 * @param b_id
	 * @return
	 */
	public boolean minusOne(int b_id);
	
	/**
	 * ģ����ѯ������
	 * @param o_id
	 * @return
	 */
	public List<Orders> dimO_id(int o_id,int sta);

}
