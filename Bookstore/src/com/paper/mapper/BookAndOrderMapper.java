package com.paper.mapper;

import java.util.ArrayList;

import com.paper.entity.BookAndOrder;

public interface BookAndOrderMapper {
	boolean addNewBookAndOrder(BookAndOrder bookAndOrder);
	ArrayList<BookAndOrder> queryAllBookAndOrder();
	ArrayList<BookAndOrder> queryBookAndOrderByOrderid(int orderid);
	int[] queryOrderidByBookid(int bookid);
}