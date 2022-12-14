package com.project.bookshop.vo;

import java.sql.Date;

/*
CREATE TABLE ord(
		order_num int PRIMARY KEY,
		order_user_email VARCHAR(50) NOT NULL,
		order_date DATE NOT NULL,
		order_status VARCHAR(20) default '결제완료',
		order_price int NOT NULL,
		constraint ord_email_fk foreign key(order_user_email) references user(user_email)
);
*/


public class OrdVO {
	private int order_num;
	private Date order_date;
	private String order_status;
	private String order_user_email;
	private int order_price;
	private int order_mileage;
	
	// 조인용 
	private String user_name;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getOrder_user_email() {
		return order_user_email;
	}
	public void setOrder_user_email(String order_user_email) {
		this.order_user_email = order_user_email;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getOrder_mileage() {
		return order_mileage;
	}
	public void setOrder_mileage(int order_mileage) {
		this.order_mileage = order_mileage;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	

	
	
}
