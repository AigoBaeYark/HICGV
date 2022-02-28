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
	public NoticeDto noticeView(String nbo) {
		
		return dao.noticeView(nbo);
	}

	@Override
	public void noticeDelete(String id) {
		
		dao.noticeDelete(id);
	}

	@Override
	public void noticeModify(NoticeDto noticeDto) {
		System.out.println("============ServiceImpl noticeModify================");
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("writer", noticeDto.getWriter());		
		map.put("no", noticeDto.getNo());		
		map.put("title", noticeDto.getTitle());		
		map.put("content", noticeDto.getContent());		
		map.put("hit", noticeDto.getHit());		
		
		System.out.println("map id :" + map.get("id"));		
		System.out.println("map nickname :" + map.get("nickname"));
		System.out.println("map date_birth :" + map.get("date_birth"));
		System.out.println("map location :" + map.get("location"));
		System.out.println("map gender :" + map.get("gender"));
		
		dao.noticeModify(noticeDto);
		
	}

	@Override
	public void noticeWrite(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		
	}
	
}
