package com.hicgv.notice.dao;

import java.util.ArrayList;

import com.hicgv.notice.dto.NoticeDto;

public interface NoticeDao {
	public int selectNoticeTotCount();

	public ArrayList<NoticeDto> noticelist();

	public NoticeDto noticeView(String nbo);

	public void noticeDelete(String id);

	public void noticeModify(NoticeDto noticeDto);
}
