package com.hicgv.ticket.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TLocationDto {
	//HICGV_THEATER와 HICGV_THEATER_LOCATION를 조인 
	private int theater_id; //지역id
	private String theater_loc; //지역
	private int location_id; //상영관id
	private String location_name; //상영관
}
