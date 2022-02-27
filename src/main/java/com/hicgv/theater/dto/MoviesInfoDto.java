package com.hicgv.theater.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MoviesInfoDto {
   private String title_kor;
   private String opening_date;
   private String genre;
   private String age_limit;
   private String room_name;
   private int max_seat;
   private String start_date;
   private int movie_id;
   private int location_id;
   private String image_url;
   private int running_time;

}