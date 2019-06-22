package zhl.controller.adm;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Est;
import zhl.entity.Orders;
import zhl.service.OrdersServiceI;

@Controller
@RequestMapping("b_orders")
public class OrdersAction {
   
	@Resource
	private OrdersServiceI serviceI;
	
	/**
	 * 查询所有已发货订单
	 * @return
	 */
	@RequestMapping("/getAllOrders1")
	@ResponseBody
	public List<Orders> getAllOrders1(){
		return serviceI.getAllOrders1();
	}
	/**
	 * 查询所有未发货订单
	 * @return
	 */
	@RequestMapping("/getAllOrders")
	@ResponseBody
	public List<Orders> getAllOrders(){
		return serviceI.getAllOrders();
	}
	
	/**
	 * 发货
	 * @param o_id
	 * @return
	 */
	@RequestMapping("/alterState")
	@ResponseBody
	public List<Est> alterState(int o_id,int b_id){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","成功");
		if(serviceI.alterState(o_id)){
			serviceI.minusOne(b_id);
			list.add(e1);
		}
		return list;
	}
	
	
	
	/**
	 * 修改订单信息
	 * @return
	 */
	@RequestMapping("/updateOrders")
	@ResponseBody
	public List<Est> updateOrders(Orders orders){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","成功");
		if(serviceI.updateOrders(orders)){
			list.add(e1);
		}
		return list;
	}
	/**
	 * 取消订单
	 * @return
	 */
	@RequestMapping("/delOrders")
	@ResponseBody
	public List<Est> delOrders(int o_id,int b_id){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","成功");
		if(serviceI.delOrders(o_id)){
			serviceI.addOne(b_id);
			list.add(e1);
		}
		return list;
	}
	
	/**
	 * 模糊查询订单号
	 * @param o_id
	 * @return
	 */
	@RequestMapping("/dimO_id")
	@ResponseBody
	public List<Orders> dimO_id(int o_id,int sta){
		return serviceI.dimO_id(o_id,sta);
	}
}
