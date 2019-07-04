package com.paper.service.impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paper.entity.BookAndOrder;
import com.paper.entity.CartItem;
import com.paper.entity.Order;
import com.paper.mapper.BookAndOrderMapper;
import com.paper.mapper.OrderMapper;
import com.paper.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}
	
	@Autowired
	BookAndOrderMapper bookAndOrderMapper;
	
	void setBookAndOrderMapper(BookAndOrderMapper bookAndOrderMapper){
		this.bookAndOrderMapper = bookAndOrderMapper;
	}
	
	@Override
	public int addNewOrder(ArrayList<CartItem> cart,int userid) {
		Timestamp timestamp = new Timestamp(new Date().getTime());
		
		Double total = new Double(0);
		BigDecimal totalDecimal = null;
		ArrayList<BookAndOrder> bookAndOrderList = new ArrayList<>();
		
		for(CartItem ci : cart) {
			totalDecimal = new BigDecimal(new Double(ci.getBook().getPrice()).toString()).multiply(new BigDecimal(ci.getNumber()));
			total += totalDecimal.doubleValue();
			bookAndOrderList.add(new BookAndOrder(ci.getBook().getId(),ci.getNumber()));
		}
		
		Order order = new Order(userid, timestamp, total ,false);
		orderMapper.addNewOrder(order);
		int orderid = orderMapper.queryOrderByTimestamp(timestamp).getId();
		
		for(BookAndOrder bao : bookAndOrderList) {
			bao.setOrderid(orderid);
			bookAndOrderMapper.addNewBookAndOrder(bao);
		}
		return orderid;
	}

	@Override
	public Order queryOrderById(int id) {
		return orderMapper.queryOrderById(id);
	}

	@Override
	public ArrayList<BookAndOrder> queryBookAndOrderByOrderId(int orderid) {
		return bookAndOrderMapper.queryBookAndOrderByOrderid(orderid);
	}

	@Override
	public ArrayList<Order> queryOrderByUserId(int userid, int page) {
		return orderMapper.queryOrderByUserId(userid, page);
	}

	@Override
	public ArrayList<BookAndOrder> queryBookAndOrderByOrderId(ArrayList<Order> orders) {
		ArrayList<BookAndOrder> bookAndOrderList = new ArrayList<>();
		for(Order order : orders) {
			bookAndOrderList.addAll(queryBookAndOrderByOrderId(order.getId()));
		}
		return bookAndOrderList;
	}

	@Override
	public boolean updateOrder(Order order) {
		boolean status = false, dealtime = false, address = false;
		
		status = orderMapper.updateOrderStatus(order);
		
		if(order.getDealtime() != null) {
			dealtime = orderMapper.updateDealtime(order);
		}
		
		if(order.getAddress() != null) {
			address = orderMapper.updateAddress(order);
		}
		
		return status || dealtime || address;
	}

}