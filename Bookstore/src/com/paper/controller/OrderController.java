package com.paper.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paper.entity.Book;
import com.paper.entity.BookAndOrder;
import com.paper.entity.CartItem;
import com.paper.entity.Order;
import com.paper.service.impl.BookServiceImpl;
import com.paper.service.impl.OrderServiceImpl;
import com.paper.service.impl.UserServiceImpl;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	OrderServiceImpl orderService;
	
	void setOederService(OrderServiceImpl orderService){
		this.orderService = orderService;
	}
	
	@Autowired
	UserServiceImpl userService;
	
	void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	@Autowired
	BookServiceImpl bookService;
	
	void setBookService(BookServiceImpl bookService) {
		this.bookService = bookService;
	}
	
	@RequestMapping("add")
	ModelAndView add(HttpServletRequest request){
		ModelAndView mv;
		HttpSession session = request.getSession();
		
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
		String username = (String) session.getAttribute("username");
		if(cart == null) {
			mv = new ModelAndView("redirect:/book/all");
		}else if(username == null){
			mv = new ModelAndView("jsps/order/msg");
			mv.addObject("login","Ê§È¥µÇÂ¼×´Ì¬£¬ÇëÖØÐÂµÇÂ¼");
		}else {
			mv = new ModelAndView("jsps/order/desc");
			int userid = userService.queryIdByUsername(username);
			int orderid = addOrder(cart, userid);
			
			Order order = getOrder(orderid);
			ArrayList<BookAndOrder> orderList = getOrderList(orderid);
			
			mv.addObject("order", order);
			mv.addObject("bookAndOrderList", orderList);
			mv.addObject("bookList", bookService.queryAllBook());
			
			session.removeAttribute("cart");
		}
		return mv;
	}
	

	synchronized int addOrder(ArrayList<CartItem> cart, int userid){
		return orderService.addNewOrder(cart, userid);	
	}
	
	Order getOrder(int orderid){
		return orderService.queryOrderById(orderid);
	}
	
	private ArrayList<BookAndOrder> getOrderList(int orderid) {
		return orderService.queryBookAndOrderByOrderId(orderid);
	}
	
	@RequestMapping("list")
	ModelAndView list(HttpServletRequest request, @RequestParam(value="page",defaultValue="0") int page) {
		ModelAndView mv;
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("username");
		if(username == null) {
			mv = new ModelAndView("jsps/order/msg");
			mv.addObject("login","Ê§È¥µÇÂ¼×´Ì¬£¬ÇëÖØÐÂµÇÂ¼");
		}else {
			mv = new ModelAndView("jsps/order/list");
			int userid = userService.queryIdByUsername(username);
			ArrayList<Order> orderList = orderService.queryOrderByUserId(userid,page * 10);
			ArrayList<BookAndOrder> bookAndOrderList = orderService.queryBookAndOrderByOrderId(orderList);
			ArrayList<Book> bookList = bookService.queryAllBook();

			session.setAttribute("orderList", orderList);
			session.setAttribute("bookAndOrderList", bookAndOrderList);
			session.setAttribute("bookList", bookList);
		}
		return mv;
	}
	
	@RequestMapping("pay/{orderid}")
	ModelAndView pay(@PathVariable("orderid") int orderid) {
		ModelAndView mv = new ModelAndView("jsps/order/desc");
		
		Order order = getOrder(orderid);
		ArrayList<BookAndOrder> orderList = getOrderList(orderid);
		
		mv.addObject("order", order);
		mv.addObject("bookAndOrderList", orderList);
		mv.addObject("bookList", bookService.queryAllBook());
		
		return mv;
	}
	
	@RequestMapping("purchase")
	ModelAndView purchase(@RequestParam("orderid") int orderid, @RequestParam("address") String address) {
		ModelAndView mv = new ModelAndView("jsps/order/msg");
		
		Order order = new Order(orderid, (byte) 1);
		order.setAddress(address);
		order.setDealtime(new Timestamp(new Date().getTime()));
		
		orderService.updateOrder(order);
		
		mv.addObject("msg","Ö§¸¶³É¹¦");
		
		return mv;
	}
}