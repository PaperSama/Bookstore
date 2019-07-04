package com.paper.entity;

public class BookAndOrder {
	private int id;
	private int bookid;
	private int booknumber;
	private int orderid;
	public BookAndOrder() {
	}
	public BookAndOrder(int bookid, int booknumber) {
		this.bookid = bookid;
		this.booknumber = booknumber;
	}
	public BookAndOrder(int bookid, int booknumber, int orderid) {
		this.bookid = bookid;
		this.booknumber = booknumber;
		this.orderid = orderid;
	}
	public BookAndOrder(int id, int bookid, int booknumber, int orderid) {
		this.id = id;
		this.bookid = bookid;
		this.booknumber = booknumber;
		this.orderid = orderid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public int getBooknumber() {
		return booknumber;
	}
	public void setBooknumber(int booknumber) {
		this.booknumber = booknumber;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
}