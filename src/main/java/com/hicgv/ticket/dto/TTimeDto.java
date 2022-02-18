package com.hicgv.ticket.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TTimeDto {
	//HICGV_THEATER_ROOM과 HICGV_THEATER_SCHEDULE을 조인
	private String room_name; //N관
	private int max_seat; //좌석수
	private String start_date; //상영시작시간
}
