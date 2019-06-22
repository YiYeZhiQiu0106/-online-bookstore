package zhl.service;

import java.util.List;

import zhl.entity.Book;

public interface BookServiceI {
	
	/**
	 * 按分类查询所有图书
	 * @param type
	 * @return
	 */
	public List<Book> findType(String type);
	
	 /**
     * 用id查一本书的详情
     * @param b_id
     * @return
     */
    public Book getOneBook(int b_id);
	
	/**
	 * 根据书名模糊查询
	 * @param name
	 * @return
	 */
	public List<Book> dimName(String name);
	 /**
	  * 获取所有图书
	  * @return
	  */
	public List<Book> getAllBook(int page,int row);
	
	/**
	 * 添加一本书
	 * @param book
	 * @return
	 */
   public int addBook(Book book);
   
   /**
    * 根据书名判断书籍是否存在
    * @param b_name
    * @return
    */
   public int oneBook(String b_name);
   
   
   /**
    * 修改图书信息
    * @param book
    * @return
    */
   public int updateBook(Book book);
   
   
   /**
    * 根据id删除书籍
    * @param b_id
    * @return
    */
   public boolean deleteBook(int b_id);
}
