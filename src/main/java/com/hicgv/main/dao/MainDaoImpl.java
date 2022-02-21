package com.hicgv.main.dao;

import java.util.ArrayList;
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
	};
}
