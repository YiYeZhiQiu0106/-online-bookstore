package zhl.controller.reception;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Book;
import zhl.entity.Collectiontable;
import zhl.entity.Evaluate;
import zhl.entity.Users;
import zhl.service.BookServiceI;
import zhl.service.CollectiontableServiceI;
import zhl.service.EvaluateServiceI;
import zhl.service.StatisticsServiceI;

@Controller
@RequestMapping("book")
public class BookReAction { 
	
	@Resource
	private BookServiceI serviceI;
	
	@Resource
	private CollectiontableServiceI coServiceI;
	
	@Resource
	private EvaluateServiceI evaluateServiceI;
	
	@Resource
	private StatisticsServiceI statisticsServiceI;
	
	
	@RequestMapping("/getOneBook")
	public String getOneBook(int b_id,Model model){
		Book book = serviceI.getOneBook(b_id);
		//显示评论
		List<Evaluate> evaList =  evaluateServiceI.getBookEva(b_id);
		//评论总条数
		int evaCount = evaList.size();
		model.addAttribute("oneBook", book);
		model.addAttribute("elist", evaList);
		model.addAttribute("evaCount", evaCount);
		return "products";
	}
	
	@RequestMapping("/userCollection")
	public String userCollection(int u_id,Model model,HttpServletRequest re){
		Object object= re.getSession().getAttribute("user");
		if(object==null){
			return "login";
		}
		List<Collectiontable> colllist=coServiceI.userCollection(u_id);
		model.addAttribute("colllist", colllist);
		return "mycollect";
	}
	
	//加入到收藏
	@RequestMapping("/addCollection")
	@ResponseBody
	public Map<String, String> addCollection(Collectiontable c,HttpServletRequest re){
		
		boolean is= false;
		List<Collectiontable> list = coServiceI.userCollection(c.getU_id());
		for(int i=0;i<list.size();i++){
			if((c.getB_id()==list.get(i).getB_id())&& (c.getU_id()==list.get(i).getU_id())){
				is=true;
				break;
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String da = sdf.format(date);
		c.setC_time(da);
		if(is){
			map.put("coll", "该图书已被收藏");
			return map;
		}
		
		 if(coServiceI.addCollection(c)){
			map.put("coll", "收藏成功！");
			//收藏量加一
			statisticsServiceI.upCollNum(c.getB_id(), 1);
		}else {
			map.put("coll", "收藏失败！");
		}
		return map;
		
		//return "redirect:/book/userCollection.action?u_id="+u_id;
	}
	
	@RequestMapping("/delCollection")
	@ResponseBody
	public Map<String, String> delCollection(int u_id,int c_id,int b_id,HttpServletRequest re){
		Map<String, String> map = new HashMap<String, String>();
		/*Object object= re.getSession().getAttribute("user");
		if(object==null){
			return "login";
		}*/
		if(coServiceI.delCollection(c_id)){
			map.put("coll", "取消收藏成功！");
			statisticsServiceI.upCollNum(b_id, -1);
		}else {
			map.put("coll", "取消收藏失败！");
		}
		return map;
		//return "redirect:/book/userCollection.action?u_id="+u_id;
	}
	
	
	//获取用户的所有评论
	@RequestMapping("/getUserEva")
	public String getUserEva(int u_id,HttpServletRequest re,Model model){
		Object object= re.getSession().getAttribute("user");
		if(object==null){
			return "login";
		}
		List<Evaluate> evaUser = evaluateServiceI.getUserEva(u_id);
		model.addAttribute("evaUser", evaUser);
		return "myEval";
	}
	
	//用户发表评论
	@RequestMapping("/addEva")
	@ResponseBody
	public Map<String, String> addEva(Evaluate e,HttpServletRequest re){
		System.out.println(e.getB_id()+"/"+e.getU_id());
		Map<String, String> map = new HashMap<String, String>();
		Users user = (Users)re.getSession().getAttribute("user");
		if(user == null){
			map.put("eva", "请先登录");
		}else if(e.getEvaluate().isEmpty()){
			map.put("eva", "评论不能为空！");
		}else {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String da = sdf.format(date);
			e.setU_id(user.getId());
			e.setE_time(da);
			e.setGoodpoor(0);
			e.setStatis(1);
			evaluateServiceI.addEva(e);
			statisticsServiceI.upEvaNum(e.getB_id(), 1);
			map.put("eva", "评论成功！");
		}
		return map;
	}
	
	//用户删除 自己的评论
	@RequestMapping("/delEva")
	@ResponseBody
    public Map<String, String> delEva(Evaluate e,HttpServletRequest re){
		Map<String, String> map = new HashMap<String, String>();
	 if(evaluateServiceI.delEva(e.getE_id())>0){
			map.put("eva", "删除成功!");
			statisticsServiceI.upEvaNum(e.getB_id(), -1);
		}else {
			map.put("eva", "删除失败!");
		}
		return map;
	}
	
	@RequestMapping("/findType")
	public String findtype(String type,Model model){
		List<Book> list =  serviceI.findType(type);
		model.addAttribute("typebook",list);
		model.addAttribute("type", type);
		return "findType";
	}
	
	
	@RequestMapping("/dimName")
	private String dimName(String b_name,Model model){
		List<Book>  list = serviceI.dimName(b_name);
		if(list.size()==0){
			model.addAttribute("dimCount", 0);
		}else {
			model.addAttribute("dimCount", 1);
		}
		model.addAttribute("namebook", list);
		model.addAttribute("dimname", b_name);
		return "dimName";
	}
}
