package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import zhl.dao.BookDaoI;
import zhl.entity.Book;
import zhl.service.BookServiceI;

@Service
public class BookServiceImpl implements BookServiceI{
	
    @Resource
	private BookDaoI bookDaoImpl;
	
	/**
	 * ��ѯ�����鼮
	 */
	public List<Book> getAllBook(int page,int row) {
		return bookDaoImpl.getAllBook(page,row);
	}

    /**
     * ���һ����
     */
	public int addBook(Book book) {
		return bookDaoImpl.addBook(book);
	}
    /**
     * ���������ж��鼮�Ƿ����
     */
	public int oneBook(String b_name) {
		return bookDaoImpl.oneBook(b_name);
	}

	public int updateBook(Book book) {
		
		return bookDaoImpl.updateBook(book);
	}

	public boolean deleteBook(int b_id) {
		return bookDaoImpl.deleteBook(b_id);
	}

	public List<Book> dimName(String name) {
		return bookDaoImpl.dimName(name);
	}

	public Book getOneBook(int b_id) {
		return bookDaoImpl.getOneBook(b_id);
	}

	public List<Book> findType(String type) {
		return bookDaoImpl.findType(type);
	}
         
}
