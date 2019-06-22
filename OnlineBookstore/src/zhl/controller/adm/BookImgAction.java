package zhl.controller.adm;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import zhl.entity.Book;
import zhl.entity.Est;
import zhl.service.BookImgServiceI;
import zhl.service.BookServiceI;

@Controller
@RequestMapping("b_img")
public class BookImgAction {
    
	@Resource
	private BookImgServiceI serviceI;
	@Resource
	private ServletContext servletContext;
	
	@RequestMapping("/getAllBookImg")
	@ResponseBody
	public List<Book> getAllBookImg(){
		List<Book> list = serviceI.getAllBookImg();
		return list; 
	}
	
	
	
	
	@RequestMapping("/deleteBookImg")
	@ResponseBody
	public List<Est> deleteBook(HttpServletRequest request,Model model){
		List<Est> list = new ArrayList<Est>();
		Est est1 = new Est("1","添加成功");
		String b_id = request.getParameter("b_id");
		boolean is = serviceI.deleteBookImg(Integer.parseInt(b_id));
		if(is){
			list.add(est1);
		}
		return list;
		
	}
	
	@RequestMapping("/updateBookImg")
	public String updateBookImg(@RequestPart("file") MultipartFile file,Book book) throws IOException{
		//文件保存
		String path = servletContext.getRealPath("/jsp/img");//通过servletContext获取项目的绝对路径
		
		book.setImg(file.getOriginalFilename());//图片名
		serviceI.updateBookImg(book);
		File targetFile = new File(path+"\\"+file.getOriginalFilename());//文件保存路径+文件名称
		FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
		return "book_img";
	}
	
	
}
