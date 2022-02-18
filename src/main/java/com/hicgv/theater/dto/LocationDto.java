package com.hicgv.theater.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LocationDto {
	private int location_id;
	private int theater_id; 
	private String location_name;
	private String location_add;
	private String location_tel;
	private String location_img;
}
