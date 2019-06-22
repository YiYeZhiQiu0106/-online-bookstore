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
	 * ��ѯ�����ѷ�������
	 * @return
	 */
	@RequestMapping("/getAllOrders1")
	@ResponseBody
	public List<Orders> getAllOrders1(){
		return serviceI.getAllOrders1();
	}
	/**
	 * ��ѯ����δ��������
	 * @return
	 */
	@RequestMapping("/getAllOrders")
	@ResponseBody
	public List<Orders> getAllOrders(){
		return serviceI.getAllOrders();
	}
	
	/**
	 * ����
	 * @param o_id
	 * @return
	 */
	@RequestMapping("/alterState")
	@ResponseBody
	public List<Est> alterState(int o_id,int b_id){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","�ɹ�");
		if(serviceI.alterState(o_id)){
			serviceI.minusOne(b_id);
			list.add(e1);
		}
		return list;
	}
	
	
	
	/**
	 * �޸Ķ�����Ϣ
	 * @return
	 */
	@RequestMapping("/updateOrders")
	@ResponseBody
	public List<Est> updateOrders(Orders orders){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","�ɹ�");
		if(serviceI.updateOrders(orders)){
			list.add(e1);
		}
		return list;
	}
	/**
	 * ȡ������
	 * @return
	 */
	@RequestMapping("/delOrders")
	@ResponseBody
	public List<Est> delOrders(int o_id,int b_id){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","�ɹ�");
		if(serviceI.delOrders(o_id)){
			serviceI.addOne(b_id);
			list.add(e1);
		}
		return list;
	}
	
	/**
	 * ģ����ѯ������
	 * @param o_id
	 * @return
	 */
	@RequestMapping("/dimO_id")
	@ResponseBody
	public List<Orders> dimO_id(int o_id,int sta){
		return serviceI.dimO_id(o_id,sta);
	}
}
