package zhl.controller.reception;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Book;
import zhl.entity.Est;
import zhl.entity.Orders;
import zhl.entity.Shoppingcart;
import zhl.entity.Users;
import zhl.service.BookServiceI;
import zhl.service.OrdersServiceI;
import zhl.service.ShoppingcartServiceI;
import zhl.service.StatisticsServiceI;
import zhl.service.UsersServiceI;


@Controller
@RequestMapping("shopCat")
public class ShopCatAction {
    @Resource
    private ShoppingcartServiceI serviceI;
    
    @Resource
    private UsersServiceI usersServiceI;
    
    @Resource
    private OrdersServiceI ordersServiceI;
    
    @Resource
    private BookServiceI bookServiceI;
    
    @Resource 
    private StatisticsServiceI statisticsServiceI;
    
    @RequestMapping("/getShopCat")
    public String getShopCat(int u_id,HttpServletRequest re){
    	Object obje = re.getSession().getAttribute("user");
    	if(obje==null){
    		return "login";
    	}
    	float sum = 0;
    	List<Shoppingcart> list  = serviceI.getShopCat(u_id);
    	
   	    //查询用户购物车记录的条数 
   	   int count = serviceI.shopCount(u_id);
       re.getSession().setAttribute("count", count);
    	
    	for(int i=0;i<list.size();i++){
    		Shoppingcart shop = list.get(i);
    		shop.setReporter(shop.getPrice()*shop.getNum());
    		serviceI.upRep(u_id, shop.getB_id(), shop.getPrice()*shop.getNum());
    	}
    	List<Shoppingcart> list1 = serviceI.getShopCat1(u_id);
    	for(int i=0;i<list1.size();i++){
    		Shoppingcart shop = list.get(i);
    		sum+=shop.getPrice()*shop.getNum();
    	}
    	re.getSession().setAttribute("catlist", list);
    	re.getSession().setAttribute("sum", sum);
    	return "myShopCat";
    }
    //删除一条商品
    @RequestMapping("/delShop")
    public String delShop(int u_id,int b_id){
    	serviceI.delShop(u_id, b_id);
    	return "redirect:/shopCat/getShopCat.action?u_id="+u_id;
    }
    
    //修改数量
    @RequestMapping("/upNum")
    public String upNum(int u_id,int b_id,int num){
    	serviceI.upNum(u_id,b_id,num);    	
    	return "redirect:/shopCat/getShopCat.action?u_id="+u_id;
    }
    
    //改变状态
    @RequestMapping("/upStatis")
    public String upStatis(int u_id,int b_id,int statis){
    	serviceI.upStatis(u_id, b_id, statis);
    	return "redirect:/shopCat/getShopCat.action?u_id="+u_id;
    }
    
    //创建订单
    @RequestMapping("/addOrder")
    public String addOrder(HttpServletRequest re){
    	int u_id =((Users)re.getSession().getAttribute("user")).getId();
    	re.getSession().setAttribute("user", usersServiceI.oneUser(u_id));
    	//查出当前用户的购物车状态为1 的所有商品信息  存入订单表
    	List<Shoppingcart> listcat = serviceI.getShopCat1(u_id);
    	Users user =usersServiceI.oneUser(u_id);
    	for(int i=0;i<listcat.size();i++){
    		//拿到这本书的库存
    		Book book = bookServiceI.getOneBook(listcat.get(i).getB_id());
    		int stock = book.getStock();
    		
    		//拿到该用户的账户余额
    		float balance =user.getBalance();
    		
    		//创建订单时间
    		 Date date = new Date();
    		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		String time = sdf.format(date);
    		Orders order = new Orders();
    		order.setAddress(user.getAddress());
    		order.setB_id(listcat.get(i).getB_id());
    		order.setB_name(listcat.get(i).getB_name());
    		order.setNum(listcat.get(i).getNum());
    		order.setO_state(0);
    		order.setO_time(time);
    		order.setPhone(user.getPhone());
    		order.setU_id(u_id);
    		order.setU_name(user.getName());
    		order.setMoney(listcat.get(i).getReporter());
    		order.setPrice(listcat.get(i).getPrice());
    		ordersServiceI.addOrders(order);
    		
    		//库存相应减少   用户账户余额减少  并每次保存到数据库 
    		stock-=order.getNum();
    		//销量相应增加
    		statisticsServiceI.upOrderNum(book.getB_id(), order.getNum());
    		book.setStock(stock);
    		
    		bookServiceI.updateBook(book);
    		balance+=order.getMoney();
    		user.setBalance(balance);
    		usersServiceI.updateUser(user);
    		
    		//生成订单号  购物车中的记录相应删除(删除我的购物车状态为1的记录)
    		serviceI.delShop(u_id, listcat.get(i).getB_id());
    	}
    	return "redirect:/shopCat/getOrders.action?u_id="+u_id;
    }
    
    /**
     * 获得我的所有订单
     * @return
     */
    @RequestMapping("/getOrders")
    public String getOrders(int u_id,Model model){
    	List<Orders> list = ordersServiceI.getUserOrders(u_id);
    	model.addAttribute("orderlist", list);
    	return "myOrder";
    }
    
    /*@RequestMapping("/addCat")
    @ResponseBody
    public List<Est> addCat(){
    	List<Est> list = new ArrayList() ;
    	
    	
		return list;
    }*/
    
    @RequestMapping("/addCat")
    public String addCat(int u_id,int b_id,int num){
    	//处理当前图书是否已在购物车   已存在 加数量
    	List<Shoppingcart> list = serviceI.getShopCat(u_id);
    	int num1 =0;
    	for(int i=0;i<list.size();i++){
    		//如果已存在  拿到先前的数量
    		Shoppingcart s=list.get(i);
    		if(s.getU_id()==u_id && s.getB_id()==b_id){
    			num1=s.getNum();
    		}
    	}
    	//isbook  true已存在
    	boolean isbook = serviceI.isOneBook(u_id, b_id);
    	if(isbook){
    		serviceI.upNum(u_id, b_id, num+num1);
    	}else {
    		Shoppingcart s = new Shoppingcart();
        	s.setU_id(u_id);
        	s.setB_id(b_id);
        	s.setNum(num);
        	s.setStatis(1);
        	s.setReporter(0);
        	serviceI.addCat(s);
		}
		return "redirect:/shopCat/getShopCat.action?u_id="+u_id;
    }
    
    @RequestMapping("/delOrd")
    @ResponseBody
    private Map<String, String> delOrd(int o_id){
    	Map<String, String> map = new HashMap<String, String>();
    	if(ordersServiceI.delOrders(o_id)){
    		map.put("ord", "取消成功");
    	}else{
    		map.put("ord", "取消失败");
    	}
    	return  map;
    }
    
}
