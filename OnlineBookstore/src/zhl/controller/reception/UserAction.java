package zhl.controller.reception;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aliyuncs.exceptions.ClientException;
import com.sun.org.apache.regexp.internal.recompile;

import zhl.entity.Booktype;
import zhl.entity.Est;
import zhl.entity.Users;
import zhl.service.UsersServiceI;
import zhl.util.RandomCode;
import zhl.util.SmsUtils;

@Controller
@RequestMapping("/user")
public class UserAction {
	
	 @Resource
	 private UsersServiceI serviceI;
	 
	    @RequestMapping("/ade")
		public String ade(HttpServletRequest re){
	    	String total_amount =(String) re.getSession().getAttribute("total_amount");
	    	
	    	Users user = (Users)re.getSession().getAttribute("user");
	    	user.setBalance(Float.parseFloat(total_amount)+user.getBalance());
	    	Object object  = re.getSession().getAttribute("zfb");
	    	if(user!=null && object=="成功"){
	    		serviceI.updateUser(user);
	    		System.out.println(user);
	    	}
	    	System.out.println(object);
			return "userCenter";
	    	
		}
		
	    @RequestMapping("/upUser")
	    @ResponseBody
	    private Map<String, String> upUser(Users users,HttpServletRequest re){
	    	Map<String, String> map = new HashMap<String, String>();
	    	users.setPwd(getMd5(users.getPwd()));
	    	if(serviceI.updateUser(users)){
	    		re.getSession().setAttribute("user", users);
	    		map.put("user", "修改成功");
	    	}else {
				map.put("user", "修改失败");
			}
			return map;
	    }
	
	    
	    /* * 对字符串进行md5加密
		 * @param str
		 * @return 
		 */
		public static String getMd5(String str) {
		 try {
		 // 生成一个MD5加密计算摘要
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 // 计算md5函数
		 md.update(str.getBytes());
		 // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
		 // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
		 String sr = new BigInteger(1, md.digest()).toString(16);
		 	return sr;
		 } catch (Exception e) {
		    System.out.println("MD5加密出现错误");
		 }
		 	return str;
		}
}
