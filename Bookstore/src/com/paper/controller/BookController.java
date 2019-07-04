package com.paper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.paper.service.impl.BookServiceImpl;

@Controller
@RequestMapping(value="book")
public class BookController {
	@Autowired
	BookServiceImpl bookService;
	
	void setBookService(BookServiceImpl bookService) {
		this.bookService = bookService;
	}
	
	@RequestMapping(value="all")
	ModelAndView all(){
		ModelAndView mv = new ModelAndView("jsps/book/list");
		mv.addObject("books", bookService.queryAllBook());
		return mv;
	}
	
	@RequestMapping(value="{cls}")
	ModelAndView cls(@PathVariable("cls") int cls) {
		ModelAndView mv = new ModelAndView("jsps/book/list");
		mv.addObject("books", bookService.queryClsBook(cls));
		return mv;
	}
	
	@RequestMapping(value="desc/{id}")
	ModelAndView desc(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("jsps/book/desc");
		mv.addObject("book", bookService.queryBookById(id));
		return mv;
	}
}