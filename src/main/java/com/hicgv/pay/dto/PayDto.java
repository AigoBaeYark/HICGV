package com.hicgv.pay.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayDto {
	private int user_id;
	private int movie_id;
	private String coupon;
	private int point;
	private String pay_method;
	private String title_kor;
	private String location_name;
	private String room_name;
	private String start_date;
	private int person;
	private String seat;
	private int tot_price;

}
