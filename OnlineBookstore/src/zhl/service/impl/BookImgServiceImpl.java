package zhl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zhl.dao.BookDaoI;
import zhl.dao.BookImgDaoI;
import zhl.entity.Book;
import zhl.service.BookImgServiceI;
import zhl.service.BookServiceI;

@Service
public class BookImgServiceImpl implements BookImgServiceI{
	
    @Resource
	private BookImgDaoI DaoImpl;

	public List<Book> getAllBookImg() {
		return DaoImpl.getAllBookImg();
	}

	public int updateBookImg(Book book) {
		return DaoImpl.updateBookImg(book);
	}

	public boolean deleteBookImg(int b_id) {
		return DaoImpl.deleteBookImg(b_id);
	}
	
	
         
}
