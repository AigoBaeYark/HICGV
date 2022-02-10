package com.hicgv.movies.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieDiretorDto {
	private int movie_diretor_id;
	private int movie_id;
	private String name_kor;
	private String name_eng;
	private Timestamp birth;
	private String nation;
	private String profession;
	private String profile_url;
	private String biography;
}
