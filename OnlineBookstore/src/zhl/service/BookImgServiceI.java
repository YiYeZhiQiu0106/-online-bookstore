package zhl.service;

import java.util.List;

import zhl.entity.Book;

public interface BookImgServiceI {
	
	 /**
	  * ��ȡ����ͼ��
	  * @return
	  */
	public List<Book> getAllBookImg();
	

   /**
    * �޸�ͼ����Ϣ
    * @param BookImg
    * @return
    */
   public int updateBookImg(Book book);
   
   
   /**
    * ����idɾ���鼮
    * @param b_id
    * @return
    */
   public boolean deleteBookImg(int b_id);
   
}
