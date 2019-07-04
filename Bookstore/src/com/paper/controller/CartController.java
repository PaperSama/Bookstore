package com.paper.controller;

import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paper.entity.CartItem;
import com.paper.service.impl.BookServiceImpl;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	BookServiceImpl bookService;
	
	void setBookService(BookServiceImpl bookService){
		this.bookService = bookService;
	}
	
	@RequestMapping(value="add")
	ModelAndView add(HttpServletRequest request, @RequestParam("id") int id, @RequestParam(value="count", defaultValue="1") int number) {
		CartItem cartItem = new CartItem(bookService.queryBookById(id),number);
		
		ArrayList<CartItem> cart;
		HttpSession session = request.getSession();
		cart = (ArrayList<CartItem>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<CartItem>();
		}
		addItem(cart, cartItem);
		
		ModelAndView mv = new ModelAndView("jsps/cart/list");
		session.setAttribute("cart", cart);
		session.setAttribute("total", total(cart));
		return mv;
	}
	
	@RequestMapping("delete/{index}")
	ModelAndView delete(HttpServletRequest request, @PathVariable("index")int index) {
		HttpSession session = request.getSession();
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
		deleteItem(cart, index);
		ModelAndView mv = new ModelAndView("jsps/cart/list");
		session.setAttribute("cart", cart);
		session.setAttribute("total", total(cart));
		return mv;
	}
	
	@RequestMapping("deleteAll")
	ModelAndView delete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("jsps/cart/list");
		session.removeAttribute("cart");
		session.removeAttribute("total");
		return mv;
	}
	
	ArrayList<CartItem> addItem(ArrayList<CartItem> cart, CartItem item){
		boolean had = false;
		for(CartItem ci : cart) {
			if(ci.getBook().getId()==item.getBook().getId()) {
				ci.setNumber(ci.getNumber() + item.getNumber());
				if(ci.getNumber() > 99999) {
					ci.setNumber(99999);
				}
				had = true;
			}
		}
		if(!had){
			cart.add(item);
		}
		
		return cart;
	}
	
	ArrayList<CartItem> deleteItem(ArrayList<CartItem> cart, int index){
		cart.remove(index);
		return cart;
	}
	
	double total(ArrayList<CartItem> cart){
		Double total = new Double(0);
		for(CartItem ci : cart) {
			BigDecimal bigDecimal = new BigDecimal(new Double(ci.getBook().getPrice()).toString()).multiply(new BigDecimal(ci.getNumber()));
			total += bigDecimal.doubleValue();
		}
		return total;
	}
}