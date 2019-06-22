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
	    	if(user!=null && object=="�ɹ�"){
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
	    		map.put("user", "�޸ĳɹ�");
	    	}else {
				map.put("user", "�޸�ʧ��");
			}
			return map;
	    }
	
	    
	    /* * ���ַ�������md5����
		 * @param str
		 * @return 
		 */
		public static String getMd5(String str) {
		 try {
		 // ����һ��MD5���ܼ���ժҪ
		 MessageDigest md = MessageDigest.getInstance("MD5");
		 // ����md5����
		 md.update(str.getBytes());
		 // digest()���ȷ������md5 hashֵ������ֵΪ8Ϊ�ַ�������Ϊmd5 hashֵ��16λ��hexֵ��ʵ���Ͼ���8λ���ַ�
		 // BigInteger������8λ���ַ���ת����16λhexֵ�����ַ�������ʾ���õ��ַ�����ʽ��hashֵ
		 String sr = new BigInteger(1, md.digest()).toString(16);
		 	return sr;
		 } catch (Exception e) {
		    System.out.println("MD5���ܳ��ִ���");
		 }
		 	return str;
		}
}
