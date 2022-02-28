package com.hicgv.notice.service;

import java.util.ArrayList;

import com.hicgv.admin.dto.AdminDto;
import com.hicgv.notice.dto.NoticeDto;

public interface NoticeService {
	//공지사항 총 개수
	public int selectNoticeTotCount();
	//공지사항 목록
	public ArrayList<NoticeDto> noticelist();
	//공지사항 글쓰기
	public void noticeWrite(NoticeDto noticeDto);
	//공지사항 자세한 내용
	public NoticeDto noticeView(String nbo);
	//공지사항 삭제
	public void noticeDelete(String id);
	//공지사항 수정
	public void noticeModify(NoticeDto noticeDto);
}
