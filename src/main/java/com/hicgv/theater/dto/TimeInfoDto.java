package com.hicgv.theater.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TimeInfoDto {
	private int running_time;
	private String start_date;
	private String movie_id;
	private int location_id;

}
