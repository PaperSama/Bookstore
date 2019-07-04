package com.paper.service;

import java.util.ArrayList;

import com.paper.entity.BookAndOrder;
import com.paper.entity.CartItem;
import com.paper.entity.Order;

public interface OrderService {
	int addNewOrder(ArrayList<CartItem> cart, int userid);
	Order queryOrderById(int id);
	ArrayList<BookAndOrder> queryBookAndOrderByOrderId(int orderid);
	ArrayList<Order> queryOrderByUserId(int userid, int page);
	ArrayList<BookAndOrder> queryBookAndOrderByOrderId(ArrayList<Order> orders);
	boolean updateOrder(Order order);
}