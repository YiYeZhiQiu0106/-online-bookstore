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
		//��ȡ���ŵ���֤��
		String codes =(String) re.getSession().getAttribute("code");
		
			//�ж��û�������ֻ���֤��� ϵͳ���͵��ֻ���֤���Ƿ�һ��
			if(codes.equals(code)){
				//���������
				users.setPwd(getMd5(users.getPwd()));
				if(serviceI.addUser(users)){
					map.put("user", "ע��ɹ�");
					re.getSession().removeAttribute("code");
					System.out.println("ע��ɹ�");
				}else{
					map.put("user", "����������,ע��ʧ��");
					System.out.println("����������,ע��ʧ��");
				}
			}else {
				map.put("user", "��֤�����ע��ʧ��");
				System.out.println("��֤�����ע��ʧ��");
			}
		return map;
	}
			
	@RequestMapping("/qingk")
	@ResponseBody
	public List<Est> qingk(HttpServletRequest re){
		List<Est> list = new ArrayList<Est>();
		Est e1 = new Est("1","�ɹ�");
		re.getSession().removeAttribute("message");
		System.out.println("�����");
		list.add(e1);
		return list;
	}
	
	@RequestMapping("/onePhone")
	@ResponseBody
	public Map<String, String> onePhone(HttpServletRequest re,String phone){
		Map<String, String> map = new HashMap<String, String>();
		if(serviceI.onePhone(phone)){
			map.put("phone", "�ֻ����Ѵ���");
			System.out.println("�Ѵ���");
		}else {
			//��ȡ��֤�룬���Ҵ浽session��
			String code = RandomCode.genCode();
			System.out.println("�ֻ���֤�룺"+code);
			//����session
			re.getSession().setAttribute("code", code);
			//ͨ�������ŵĹ����� ���Ͷ���
			try {
				SmsUtils.sendSms(phone, code);
				System.out.println("�����ֻ����ųɹ�...");
				map.put("phone", "�����ѷ��ͣ�");
			} catch (ClientException e) {
				e.printStackTrace();
				System.out.println("�����ֻ�����ʧ��...");
				map.put("phone", "���ŷ���ʧ�ܣ�");
			}
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
