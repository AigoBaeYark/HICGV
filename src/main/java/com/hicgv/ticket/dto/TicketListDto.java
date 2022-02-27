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
	private String day; //TO_CHAR (START_DATE, 'dd') AS DAY 영화 날짜 자른것
    private String start_date;
    private String room_name;
    private String starttime; //TO_CHAR(START_DATE, 'hh:MI') AS STARTTIME 상영시작시간 자른것
    private int running_time;
    private int max_seat;
    private String starthour; //TO_CHAR(START_DATE, 'hh') AS STARTHOUR
    private String startminute; //TO_CHAR(START_DATE, 'MI') AS STARTMINUTE
}
