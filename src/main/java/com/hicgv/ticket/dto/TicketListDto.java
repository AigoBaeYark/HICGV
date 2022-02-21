package com.hicgv.ticket.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TicketListDto {
	private int theater_schedule_id;
	private int movie_id;
	private String title_kor;
	private String age_limit;
	private int theater_id;
	private String theater_loc;
	private int location_id;
	private String location_name;
	private String day; //substr(start_date, 9, 2) as day 영화 날짜 자른것
    private String start_date;
    private String room_name;
    private String starttime; //substr(start_date, 12, 6) as starttime 상영시작시간 자른것
    private int running_time;
    private int max_seat;

}
