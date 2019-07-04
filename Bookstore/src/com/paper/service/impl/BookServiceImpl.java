package com.paper.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paper.entity.Book;
import com.paper.entity.Cls;
import com.paper.mapper.BookMapper;
import com.paper.service.BookService;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookMapper bookMapper;
	
	void setBookMapper(BookMapper bookMapper){
		this.bookMapper = bookMapper;
	}
	
	@Override
	public ArrayList<Book> queryAllBook() {
		return bookMapper.queryAllBook();
	}

	@Override
	public Book queryBookById(int id) {
		return bookMapper.queryBookById(id);
	}

	@Override
	public ArrayList<Book> queryClsBook(int cls) {
		return bookMapper.queryClsBook(cls);
	}

	public ArrayList<Cls> queryAllCls() {
		return bookMapper.queryAllCls();
	}

}