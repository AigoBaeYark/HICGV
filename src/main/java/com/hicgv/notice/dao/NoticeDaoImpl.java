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
	public NoticeDto noticeView(int no) {
		System.out.println("==========noticeDaoImpl contentView============");
		System.out.println("no :" + no);
		// System.out.println("id:" + session.getAttribute("id"));
		Map<String, Object> Map = new HashMap<String, Object>();
		Map.put("no", no);	//여러개 보낼때 주로 맵 사용
		// AdminDao adminDao =sqlSession.selectOne(id);
		NoticeDto noticeDto = sqlSession.selectOne(nameSpace + ".noticeView", no);
		return noticeDto;
	}

	@Override
	public void noticeDelete(int no) {

		sqlSession.delete(nameSpace + ".noticeDelete", no);

	}

	@Override
	public void noticeModify(NoticeDto noticeDto) {
		System.out.println("==========adminDaoImpl customerModify============");

		sqlSession.update(nameSpace + ".noticeModify", noticeDto);

	}

	@Override
	public void noticeWrite(NoticeDto noticeDto) {
		sqlSession.insert(nameSpace + ".noticeWrite", noticeDto);
	}

}
