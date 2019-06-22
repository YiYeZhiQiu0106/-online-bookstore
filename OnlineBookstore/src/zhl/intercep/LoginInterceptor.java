package zhl.intercep;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录拦截器
 * @author zhl
 *
 */
public class LoginInterceptor implements HandlerInterceptor{
	/**
	 * 请求资源之后 不管有无异常都执行
	 */
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}
	
	/**
	 * 请求资源之后 如果没有异常，执行
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	
	/**
	 * 请求资源之前，根据方法的返回值  判断是否进入下一个 拦截器或者 目标的action
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
				boolean flag = false;
				//获取请求的uri
				String url =request.getRequestURI();
				//根据请求路径 判断
				if(!url.contains("b_")){
					//放行 
					flag = true;
				}else{
					if(url.contains("login")){
						flag = true;
					}else{
						//获取session   取 name值
						//说明已经访问过系统  取 name值
						Object obj = request.getSession().getAttribute("adm");
							if(obj!=null){
								flag = true;
				}else {
					String path = request.getContextPath()+"/jsp/b_login.jsp";
					response.sendRedirect(path);
				}
					}
						
				}
				return flag;
		}
}