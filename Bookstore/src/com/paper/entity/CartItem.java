package com.paper.entity;

public class CartItem {
	private Book book;
	private int number;
	public CartItem() {}
	public CartItem(Book book, int number) {
		this.book = book;
		this.number = number;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
}