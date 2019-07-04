package com.paper.mapper;

import java.util.ArrayList;

import com.paper.entity.Book;
import com.paper.entity.Cls;

public interface BookMapper {
	ArrayList<Book> queryAllBook();
	ArrayList<Book> queryClsBook(int cls);
	ArrayList<Cls> queryAllCls();
	Book queryBookById(int id);
	boolean addNewBook(Book book);
	boolean deleteBookById(int id);
	boolean updateBookById(int id);
}