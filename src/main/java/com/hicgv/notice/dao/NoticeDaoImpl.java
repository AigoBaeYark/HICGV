package com.hicgv.notice.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hicgv.admin.dto.AdminDto;
import com.hicgv.notice.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sqlSession;

	private static String nameSpace = "NoticeMapper";

	@Override
	public int selectNoticeTotCount() {
		System.out.println("=====NoticeDaoIplm selectNoticeTotCount=====");
		return sqlSession.selectOne(nameSpace + ".selectNoticeTotCount");
	}

	@Override
	public ArrayList<NoticeDto> noticelist() {
		System.out.println("=====noticeDaoImpl noticelist=====");

		List<NoticeDto> dto = sqlSession.selectList(nameSpace + ".noticelist");
		for (NoticeDto noticeDto : dto) {
			System.out.println(noticeDto.getTitle());
			System.out.println(noticeDto.getWriter());
			System.out.println(noticeDto.getContent());
			System.out.println(noticeDto.getHit());
			System.out.println(noticeDto.getContent());

		}
		return (ArrayList<NoticeDto>) dto;
	}

	@Override
	public NoticeDto noticeView(String nbo) {
		System.out.println("==========noticeDaoImpl contentView============");
		System.out.println("nbo :" + nbo);
		// System.out.println("id:" + session.getAttribute("id"));
		Map<String, Object> Map = new HashMap<String, Object>();
		Map.put("nbo", nbo);
		// AdminDao adminDao =sqlSession.selectOne(id);
		NoticeDto noticeDto = sqlSession.selectOne(nameSpace + ".contentView", Map);
		return noticeDto;
	}

	@Override
	public void noticeDelete(String id) {

		Map<String, String> Map = new HashMap<String, String>();
		Map.put("id", id);

		System.out.println("id :" + Map.get("id"));

		sqlSession.delete(nameSpace + ".noticeDelete", Map);

	}

	@Override
	public void noticeModify(NoticeDto noticeDto) {
		System.out.println("==========adminDaoImpl customerModify============");

		sqlSession.update(nameSpace + ".noticeModify", noticeDto);

	}

}
