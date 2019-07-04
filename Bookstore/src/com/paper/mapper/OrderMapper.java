package com.paper.mapper;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.paper.entity.Order;

public interface OrderMapper {
	boolean addNewOrder(Order order);
	ArrayList<Order> queryAllOrder();
	ArrayList<Order> queryOrderByUserId(int userid, int page);
	Order queryOrderById(int id);
	boolean updateOrderStatus(Order order);
	Order queryOrderByTimestamp(Timestamp timestamp);
	boolean updateAddress(Order order);
	boolean updateDealtime(Order order);
}