package com.hicgv.store.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreDto {
	private int product_id;
	private int product_price;
	private String product_name;
	private String product_img;
	private String product_script;
}
