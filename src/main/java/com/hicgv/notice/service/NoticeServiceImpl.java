package com.hicgv.notice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hicgv.notice.dao.NoticeDao;
import com.hicgv.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	NoticeDao dao;
	
	@Override
	public int selectNoticeTotCount() {
		
		return dao.selectNoticeTotCount();
	}

	@Override
	public ArrayList<NoticeDto> noticelist() {
		
		return dao.noticelist();
	}

	@Override
	public NoticeDto noticeView(int no) {
		
		return dao.noticeView(no);
	}

	@Override
	public void noticeDelete(int no) {
		
		dao.noticeDelete(no);
	}

	@Override
	public void noticeModify(NoticeDto noticeDto) {
		System.out.println("============ServiceImpl noticeModify================");
		
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("writer", noticeDto.getWriter());		
		map.put("no", noticeDto.getNo());		
		map.put("title", noticeDto.getTitle());		
		map.put("content", noticeDto.getContent());		
		
		System.out.println("map writer :" + map.get("writer"));		
		System.out.println("map nickname :" + map.get("no"));
		System.out.println("map no :" + map.get("title"));
		System.out.println("map content :" + map.get("content"));
		
		
		dao.noticeModify(noticeDto);
		
	}

	@Override
	public void noticeWrite(NoticeDto noticeDto) {
		System.out.println("============ServiceImpl noticeWrite================");
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("writer", noticeDto.getWriter());
		map.put("no", noticeDto.getNo());
		map.put("ncreate_at", noticeDto.getNcreate_at());
		map.put("title", noticeDto.getTitle());
		map.put("content", noticeDto.getContent());
		map.put("hit", noticeDto.getHit());
		
		System.out.println("map writer : " + map.get("writer"));
		System.out.println("map title : " + map.get("title"));
		System.out.println("map no : " + map.get("no"));
		System.out.println("map ncreate_at : " + map.get("ncreate_at"));
		System.out.println("map content : " + map.get("content"));
		System.out.println("map hit : " + map.get("hit"));

		dao.noticeWrite(noticeDto);
	}
	
}
