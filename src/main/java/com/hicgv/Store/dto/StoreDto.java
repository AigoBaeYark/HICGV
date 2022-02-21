package com.hicgv.store.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreDto {
	private int product_id;
	private int product_categori;
	private String product_categori_name;
	private String product_name;
	private int product_price;
	private String product_script;
	private String product_img;
}
