package com.hicgv.notice.dao;

import java.util.ArrayList;

import com.hicgv.notice.dto.NoticeDto;

public interface NoticeDao {
	public int selectNoticeTotCount();

	public ArrayList<NoticeDto> noticelist();

	public NoticeDto noticeView(int no);

	public void noticeDelete(int no);

	public void noticeModify(NoticeDto noticeDto);
	
	public void noticeWrite(NoticeDto noticeDto); 
}
