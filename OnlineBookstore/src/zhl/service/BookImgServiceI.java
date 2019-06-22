package zhl.service;

import java.util.List;

import zhl.entity.Book;

public interface BookImgServiceI {
	
	 /**
	  * 获取所有图书
	  * @return
	  */
	public List<Book> getAllBookImg();
	

   /**
    * 修改图书信息
    * @param BookImg
    * @return
    */
   public int updateBookImg(Book book);
   
   
   /**
    * 根据id删除书籍
    * @param b_id
    * @return
    */
   public boolean deleteBookImg(int b_id);
   
}
