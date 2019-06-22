package zhl.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import zhl.entity.Book;
import zhl.entity.Users;

public interface BookImgDaoI {
	
	
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
