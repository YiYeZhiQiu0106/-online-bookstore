package zhl.controller.adm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import zhl.entity.Administrator;
import zhl.entity.Est;
import zhl.entity.Statistics;
import zhl.service.AdministratorServiceI;
import zhl.service.StatisticsServiceI;
import zhl.util.RandomCode;

@Controller
@RequestMapping("b_adm")
public class AdministratorAction {
	
	
	@Resource 
	private AdministratorServiceI serviceI;
	
	@Resource
	private StatisticsServiceI staI;
          
	
	/**
	 * adm登录
	 * @param a_idNumber
	 * @param pwd
	 * @return
	 */
	@RequestMapping("/login")
	public String login(@Param("a_idNumber")String a_idNumber,@Param("a_pwd")String a_pwd,HttpServletRequest re){
		Administrator adm = serviceI.longin(a_idNumber, a_pwd);
		if(adm != null){
			re.getSession().setAttribute("adm", adm);
			String oldTime =((String)re.getSession().getAttribute("newTime")==null)?"":(String)re.getSession().getAttribute("newTime");
			Date date = new Date();
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String newTime = sdf.format(date);
			//re.getSession().getAttribute("newTime");
			re.getSession().setAttribute("oldTime", oldTime);
			re.getSession().setAttribute("newTime", newTime);
			return "b_index";
		}else{
			re.getSession().setAttribute("message", "账号或者密码有误...");
			return "b_login";
		}
		
	}
	
	/**
	 * 退出登录
	 * @param re
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpServletRequest re){
		re.getSession().setAttribute("adm", null);
		re.getSession().setAttribute("yes1", null);
		re.getSession().setAttribute("message", "已成功退出");
		return "b_login";
	}
	
	@RequestMapping("/updateAdm")
	public String updateAdm(Administrator adm,HttpServletRequest re){
		Administrator adm1=(Administrator)re.getSession().getAttribute("adm");
		adm.setA_id(adm1.getA_id());
		if(serviceI.updateAdm(adm)){
		  re.getSession().setAttribute("adm", adm);
		  re.getSession().setAttribute("yes1", "修改成功");
		}else {
		  re.getSession().setAttribute("yes1", "修改失败");
		}
		return "b_pwd";
	}
	
	@RequestMapping("/qingk")
	public String qingk(HttpServletRequest re){
		re.getSession().setAttribute("yes1", null);
		return "b_pwd";
	}
}
