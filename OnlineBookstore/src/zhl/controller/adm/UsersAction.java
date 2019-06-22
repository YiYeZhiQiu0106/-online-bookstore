package zhl.controller.adm;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Booktype;
import zhl.entity.Est;
import zhl.entity.Users;
import zhl.service.UsersServiceI;

@Controller
@RequestMapping("b_users")
public class UsersAction {
	
	 @Resource
	 private UsersServiceI serviceI;
	 
	    @RequestMapping("/getAllUsers")
	    @ResponseBody
		public List<Users>  getAllUsers(){
			List<Users> list = serviceI.getAllUsers();
			return list;
		}
		
		@RequestMapping("/addUser")
		@ResponseBody
		public List<Est> addUser(Users users){
			List<Est> list = new ArrayList<Est>();
			Est est1 = new Est("1","添加成功");
			int is1 = serviceI.oneName(users.getName());
			boolean is2 = serviceI.onePhone(users.getPhone());
			if(is1>0){
				list.add(new Est("2","用户名已注册"));
			}
			else if(is2){
				list.add(new Est("3","手机号已注册"));
			}else {
				list.add(est1);
				serviceI.addUser(users);
			}
			return list;
		}
		
		@RequestMapping("/delUser")
		@ResponseBody
		public List<Est> delUser(int id){
			List<Est> list = new ArrayList<Est>();
			Est est1 = new Est("1","成功");
			if(serviceI.delUser(id)){
				list.add(est1);
			}
			return list;
		}
		
		@RequestMapping("/updateUser")
		@ResponseBody
		public List<Est> updateUser(Users users){
			List<Est> list = new ArrayList<Est>();
			Est est1 = new Est("1","成功");
			if(serviceI.updateUser(users)){
				list.add(est1);
			}
			return list;
		}
       
		@RequestMapping("/dimName")
		@ResponseBody
		public List<Users> dimName(String name){
			List<Users> list =serviceI.dimName(name) ;
			return list;
		}
}
