package com.hicgv.theater.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheduleDto {
	private int movie_id;
	private int theater_room_id;
	private String start_date;
	private int location_id;
	private String schdate;

}
