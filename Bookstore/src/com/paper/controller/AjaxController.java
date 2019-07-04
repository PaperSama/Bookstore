package com.paper.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paper.entity.Cls;
import com.paper.service.impl.BookServiceImpl;

@RestController
@RequestMapping("get")
public class AjaxController {
	
	@Autowired
	BookServiceImpl bookService;
	
	void setBookService(BookServiceImpl bookService){
		this.bookService = bookService;
	}
	
	@RequestMapping("cls")
	ArrayList<Cls> getCls() {
		return bookService.queryAllCls();
	}
}