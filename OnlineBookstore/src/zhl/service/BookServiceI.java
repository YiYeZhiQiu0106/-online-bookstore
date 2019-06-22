package zhl.service;

import java.util.List;

import zhl.entity.Book;

public interface BookServiceI {
	
	/**
	 * �������ѯ����ͼ��
	 * @param type
	 * @return
	 */
	public List<Book> findType(String type);
	
	 /**
     * ��id��һ���������
     * @param b_id
     * @return
     */
    public Book getOneBook(int b_id);
	
	/**
	 * ��������ģ����ѯ
	 * @param name
	 * @return
	 */
	public List<Book> dimName(String name);
	 /**
	  * ��ȡ����ͼ��
	  * @return
	  */
	public List<Book> getAllBook(int page,int row);
	
	/**
	 * ���һ����
	 * @param book
	 * @return
	 */
   public int addBook(Book book);
   
   /**
    * ���������ж��鼮�Ƿ����
    * @param b_name
    * @return
    */
   public int oneBook(String b_name);
   
   
   /**
    * �޸�ͼ����Ϣ
    * @param book
    * @return
    */
   public int updateBook(Book book);
   
   
   /**
    * ����idɾ���鼮
    * @param b_id
    * @return
    */
   public boolean deleteBook(int b_id);
}
