package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.OrdersDaoI;
import zhl.entity.Orders;
import zhl.service.OrdersServiceI;

@Service
public class OrdersServiceImpl implements OrdersServiceI{
	
	@Resource
	private OrdersDaoI daoI;

	public List<Orders> getAllOrders() {
		
		return daoI.getAllOrders();
	}

	public boolean alterState(int o_id) {
		if(daoI.alterState(o_id)>0){
			return true;
		}
		return false;
	}

	public boolean addOrders(Orders orders) {
		if(daoI.addOrders(orders)>0){
			return true;
		}
		return false;
	}

	public boolean updateOrders(Orders orders) {
		if(daoI.updateOrders(orders)>0){
			return true;
		}
		return false;
	}

	public boolean delOrders(int o_id) {
		if(daoI.delOrders(o_id)>0){
			return true;
		}
		return false;
	}

	public List<Orders> getUserOrders(int u_id) {
		
		return daoI.getUserOrders(u_id);
	}

	public boolean addOne(int b_id) {
		if(daoI.addOne(b_id)>0){
			return true;
		}
		return false;
	}

	public boolean minusOne(int b_id) {
		if(daoI.minusOne(b_id)>0){
			return true;
		}
		return false;
	}

	public List<Orders> getAllOrders1() {
		return daoI.getAllOrders1();
	}

	public List<Orders> dimO_id(int o_id,int sta) {
		return daoI.dimO_id(o_id,sta);
	}

}
