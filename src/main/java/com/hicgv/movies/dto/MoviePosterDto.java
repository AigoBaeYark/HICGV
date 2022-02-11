package com.hicgv.movies.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MoviePosterDto {
	private int movie_poster_id; 
	private int movie_id ;
	private String poster_url ;
}
