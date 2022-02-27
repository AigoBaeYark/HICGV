package com.hicgv.movies.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MoviesDto {
	private String movie_id;
	private int ranking;
	private String title_kor;
	private String title_eng;
	private String actor;
	private String director;
	private String production_date;
	private String opening_date;
	private String genre;
	private String nation;
	private int running_time;
	private String description;
	private String age_limit;
	private String image_url;
	private int audience_total;
	private int audience_today;
	private int audience_yesterday;
	private int audience_rating;
	private int booking_rate;
}
