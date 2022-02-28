package com.hicgv.notice.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeDto {
	String writer;
	int no;
	Timestamp ncreate_at;
	String title;
	String content;
	int hit;
}
