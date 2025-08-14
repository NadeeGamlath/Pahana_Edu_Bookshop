package com.insert.model;

import java.security.Timestamp;

public class BillBean {
	private int bill_id;
    private String customer_id;
    private String customer_name;
    private String item_ids;
    private String item_names;
    private String quantities;
    private double total_amount;
    private Timestamp bill_date;
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getItem_ids() {
		return item_ids;
	}
	public void setItem_ids(String item_ids) {
		this.item_ids = item_ids;
	}
	public String getItem_names() {
		return item_names;
	}
	public void setItem_names(String item_names) {
		this.item_names = item_names;
	}
	public String getQuantities() {
		return quantities;
	}
	public void setQuantities(String quantities) {
		this.quantities = quantities;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public Timestamp getBill_date() {
		return bill_date;
	}
	public void setBill_date(Timestamp bill_date) {
		this.bill_date = bill_date;
	}
    
}
