package zhl.controller.adm;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Booktype;
import zhl.entity.Est;
import zhl.service.BookServiceI;
import zhl.service.BooktypeServiceI;

@Controller
@RequestMapping("b_type")
public class BooktypeAction {
	
	@Resource
	private BooktypeServiceI typeServiceI;
	
	@RequestMapping("/getAlltype")
	@ResponseBody
	public List<Booktype> getAllType(){
		List<Booktype> list = typeServiceI.getAllType();
		return list;
	}
	
	@RequestMapping("/addType")
	@ResponseBody
	public List<Est> addType(Booktype booktype){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		int is = typeServiceI.oneType(booktype.getBt_name());
		if(is!=0){
			list.add(new Est("2","失败"));
			return list;
		}else{
			typeServiceI.addType(booktype);
			list.add(est1);
			return list;
		}
	}
	
	@RequestMapping("/deleteType")
	@ResponseBody
	public List<Est> deleteType(int bt_id){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		int i =typeServiceI.deleteType(bt_id);
		if(i>0){
			list.add(est1);
			return list;
		}
		return list;
	}
	
	@RequestMapping("/updateType")
	@ResponseBody
	public List<Est> updateType(Booktype booktype){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		int i = typeServiceI.updateType(booktype);
		if(i>0){
			list.add(est1);
			return list;
		}
		return list;
	}

	@RequestMapping("/dimName")
	@ResponseBody
	public List<Booktype> dimName(String name){
		List<Booktype> list = typeServiceI.dimName(name);
		return list;
	}
}
