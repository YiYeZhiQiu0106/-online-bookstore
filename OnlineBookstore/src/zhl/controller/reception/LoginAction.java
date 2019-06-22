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
import javax.servlet.http.HttpSession;

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
@RequestMapping("login")
public class LoginAction {
	
	 @Resource
	 private UsersServiceI serviceI;
	 
	    @RequestMapping("/login")
		public String login(HttpServletRequest re,Users users){
	        users.setPwd(getMd5(users.getPwd()));
	    	Users user = serviceI.login(users);
	    	if(user!=null){
	    		re.getSession().setAttribute("user", user);
	    		return "index";
	    	}else {
				return "login";
			}
		}
		
	@RequestMapping("/regist")
	@ResponseBody
	public Map<String, String> rigist(Users users,String code,HttpServletRequest re){
		Map<String, String> map  = new HashMap<String, String>(); 
		//获取短信的验证码
		String codes =(String) re.getSession().getAttribute("code");
		
			//判断用户输入的手机验证码和 系统发送的手机验证码是否一致
			if(codes.equals(code)){
				//对密码加密
				users.setPwd(getMd5(users.getPwd()));
				if(serviceI.addUser(users)){
					map.put("user", "注册成功");
					re.getSession().removeAttribute("code");
					System.out.println("注册成功");
				}else{
					map.put("user", "服务器错误,注册失败");
					System.out.println("服务器错误,注册失败");
				}
			}else {
				map.put("user", "验证码错误，注册失败");
				System.out.println("验证码错误，注册失败");
			}
		return map;
	}
			
	@RequestMapping("/qingk")
	@ResponseBody
	public List<Est> qingk(HttpServletRequest re){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","成功");
		re.getSession().removeAttribute("message");
		System.out.println("已清空");
		list.add(e1);
		return list;
	}
	
	@RequestMapping("/onePhone")
	@ResponseBody
	public Map<String, String> onePhone(HttpServletRequest re,String phone){
		Map<String, String> map = new HashMap<String, String>();
		if(serviceI.onePhone(phone)){
			map.put("phone", "手机号已存在");
			System.out.println("已存在");
		}else {
			//获取验证码，并且存到session里
			String code = RandomCode.genCode();
			System.out.println("手机验证码："+code);
			//存入session
			re.getSession().setAttribute("code", code);
			//通过发短信的工具类 发送短信
			try {
				SmsUtils.sendSms(phone, code);
				System.out.println("发送手机短信成功...");
				map.put("phone", "短信已发送！");
			} catch (ClientException e) {
				e.printStackTrace();
				System.out.println("发送手机短信失败...");
				map.put("phone", "短信发送失败！");
			}
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
