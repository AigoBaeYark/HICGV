package com.hicgv.movies.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieTrailerDto {
	private int movie_trailer_id; 
	private int movie_id ;
	private String trailer_title ;
	private String trailer_url ;
	private String trailer_image_url;

}
