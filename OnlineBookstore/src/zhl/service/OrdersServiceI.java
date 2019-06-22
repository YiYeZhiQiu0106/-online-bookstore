package zhl.service;

import java.util.List;

import zhl.entity.Orders;

public interface OrdersServiceI {
	
	
	/**
	 * 查询所有已发货订单
	 * @return
	 */
	public List<Orders> getAllOrders1();
	
	/**
	 * 查询所有未发货订单
	 * @return
	 */
	public List<Orders> getAllOrders();
	
	/**
	 * 发货(改变状态)
	 * @return
	 */
	public boolean alterState(int o_id);
	
	/**
	 * 新增订单
	 * @param orders
	 * @return
	 */
	public boolean addOrders(Orders orders); 
	
	/**
	 * 修改
	 * @return
	 */
	public boolean updateOrders(Orders orders);
	
	
	/**
	 * 取消订单
	 * @param o_id
	 * @return
	 */
	public boolean delOrders(int o_id);
	
	
	/**
	 * 查询个人用户的所有订单
	 * @param u_id
	 * @return
	 */
	public List<Orders> getUserOrders(int u_id);
	
	/**
	 * 数量+1
	 * @param b_id
	 * @return
	 */
	public boolean addOne(int b_id);
	
	/**
	 * 数量-1
	 * @param b_id
	 * @return
	 */
	public boolean minusOne(int b_id);
	
	/**
	 * 模糊查询订单号
	 * @param o_id
	 * @return
	 */
	public List<Orders> dimO_id(int o_id,int sta);

}
