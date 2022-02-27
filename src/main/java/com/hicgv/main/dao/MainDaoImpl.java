package com.hicgv.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.movies.dto.MoviesDto;

//현재 클래스를 스프링에서 관리하는 dao bean으로 설정
@Repository
public class MainDaoImpl implements MainDao{
	
	//mybatis의 SqlSession 객체를 스프링에서 주입시킴
    //의존관계 주입 느슨한 결합, 제어의 역전
    //@Inject 어노테이션이 있어 sqlSession은 null상태가 아닌 외부에서 객체를 주입받는 형태가 된다.
	
	@Inject
	SqlSession sqlSession;
	private static String nameSpace = "com.hicgv.main.dao.MainDao";
	
	
	//영화순위 (10위까지)
	@Override
	public ArrayList<MoviesDto> movieChart() {
		List<MoviesDto> list = sqlSession.selectList(nameSpace+".movieChart");
		return (ArrayList<MoviesDto>) list;
	}


	@Override
	public int checkMovieId(String movieid) {
		System.out.println("checkDao : "+sqlSession.selectOne(nameSpace+".checkMovieId",movieid));
		return sqlSession.selectOne(nameSpace+".checkMovieId",movieid);
	}


	@Override
	public void insertAllActor(HashMap<String, Object> allActor) {
		System.out.println("daoActor : ");
		sqlSession.insert(nameSpace+".insertAllActor",allActor);
	}


	@Override
	public void insertMovie(MoviesDto moviesDto) {
		
		System.out.println("================ insertDao ================");
		System.out.println("배우 : "+moviesDto.getActor());
		System.out.println("영화이름 : "+moviesDto.getTitle_kor());
		System.out.println("영화이름 영문 : "+moviesDto.getTitle_eng());
		System.out.println("영화이이디 : "+moviesDto.getMovie_id());
		System.out.println("영화배우 : "+moviesDto.getActor());
		System.out.println("영화감독 : "+moviesDto.getDirector());
		System.out.println("영화개봉일 : "+moviesDto.getOpening_date());
		System.out.println("영화설명 : "+moviesDto.getDescription());
		System.out.println("관람제한 : "+moviesDto.getAge_limit());
		System.out.println("장르 : "+moviesDto.getGenre());
		System.out.println("상영시간 : "+moviesDto.getRunning_time());
		
		
		sqlSession.insert(nameSpace+".insertMovie",moviesDto);
	}


	@Override
	public void updateDailyRank(LinkedList<HashMap<String, String>> updateMovieRank) {
		sqlSession.update(nameSpace+".updateDailyRank",updateMovieRank);
	};
}
