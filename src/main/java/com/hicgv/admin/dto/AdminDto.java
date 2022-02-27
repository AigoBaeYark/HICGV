package com.hicgv.admin.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AdminDto {
	int user_id;
	String id;
	String password;
	String name;
	String phone_number;
	String nickname;
	String gender;
	String date_birth;
	String location;
	Timestamp create_at;
	String email;
	int grade;
	String question;
	String answer;


}
