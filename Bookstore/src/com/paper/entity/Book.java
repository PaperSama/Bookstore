package com.paper.entity;

public class Book {
	private int id;
	private String img;
	private String title;
	private String author;
	private double price ;
	public Book() {}
	public Book(int id, String img, String title, String author, double price) {
		this.id = id;
		this.img = img;
		this.title = title;
		this.author = author;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}