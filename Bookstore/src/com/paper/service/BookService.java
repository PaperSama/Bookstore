package com.paper.service;
import java.util.ArrayList;

import com.paper.entity.Book;
import com.paper.entity.Cls;

public interface BookService {
	ArrayList<Book> queryAllBook();
	ArrayList<Book> queryClsBook(int cls);
	ArrayList<Cls> queryAllCls();
	Book queryBookById(int id);
}