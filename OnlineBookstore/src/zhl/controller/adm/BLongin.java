package zhl.controller.adm;

import java.util.ArrayList;
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

import zhl.entity.Book;
import zhl.entity.Est;
import zhl.service.BookServiceI;

@Controller
@RequestMapping("b_longin")
public class BLongin {
    
	@Resource
	private BookServiceI bookServiceImpl;
	
	@RequestMapping("/getAllBook")
	@ResponseBody
	public List<Book> getAllBook(HttpServletRequest request){
		String pageStr =request.getParameter("page")==null?"1":request.getParameter("page");
		String rowStr =request.getParameter("rows")==null?"10":request.getParameter("rows");
		int page = Integer.parseInt(pageStr);
		int row = Integer.parseInt(rowStr);
		List<Book> list = bookServiceImpl.getAllBook((page-1)*row,row);
		return list; 
	}
	
	/**
	 * 添加
	 * @param book
	 * @param model
	 * @return
	 */
	@RequestMapping("/addBook")
	@ResponseBody
	public List<Est> addBook(Book book,Model model){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		//判断书籍是否存在
		int is = bookServiceImpl.oneBook(book.getB_name());
		if(is==0){
			bookServiceImpl.addBook(book);
			list.add(est1);
			return list;
		}
		return list;
	}
	
	
	@RequestMapping("/deleteBook")
	@ResponseBody
	public List<Est> deleteBook(HttpServletRequest request,Model model){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		String b_id = request.getParameter("b_id");
		boolean is = bookServiceImpl.deleteBook(Integer.parseInt(b_id));
		if(is){
			list.add(est1);
			return list;
		}
		return list;
		
	}
	
	@RequestMapping("/updateBook")
	@ResponseBody
	public List<Est> updateBook(Book book){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		Est est2 = new Est("2","添加失败");
		int i = bookServiceImpl.updateBook(book);
		if(i>0){
			list.add(est1);
			return list;
		}else {
			list.add(est2);
			return list;
		}
	}
	
	@RequestMapping("/dimName")
	@ResponseBody
	public List<Book> dimName(String name){
		List<Book> list = new ArrayList<Book>();
		list = bookServiceImpl.dimName(name);
		return list;
	}
}
