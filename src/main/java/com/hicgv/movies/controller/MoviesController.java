package com.hicgv.movies.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.movies.dao.MoviesDao;
import com.hicgv.movies.dto.MoviesDto;


@Controller
public class MoviesController {
	
	@Autowired
	private SqlSession sqlSession; //sqlSession은 트랜젝션(SELECT, UPDATE, INSERT, DELETE 등) 관련하여 해당 기능을 사용하기 쉽게 해주는것
	
	@RequestMapping("/movies")
	public String movies(Model model) {
		System.out.println("========= < pass by movies() > =========");

		MoviesDao dao=sqlSession.getMapper(MoviesDao.class); //sql세션은 트랜젝션 관련하여 해당 기능을 사용하기 쉽게 해주는것
		ArrayList<MoviesDto> moives=dao.movies(); //1.moives()는 MoviesDao moives()로
		model.addAttribute("movies",moives); 
		
		
		return "movies/movies";
		
		
	}
	
}
