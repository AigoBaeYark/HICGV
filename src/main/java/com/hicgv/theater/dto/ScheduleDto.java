package com.hicgv.theater.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ScheduleDto {
	private int MOVIE_ID;
	private int THEATER_ROOM_ID;
	private String START_DATE;
	private int LOCATION_ID;

}
