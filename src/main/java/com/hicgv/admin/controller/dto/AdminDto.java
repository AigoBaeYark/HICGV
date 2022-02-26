package com.hicgv.admin.controller.dto;

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

	public AdminDto(int user_id, String id, String password, String name, String phone_number, String nickname,
			String gender, String date_birth, String location, Timestamp create_at, String email, int grade,
			String question, String answer) {

		this.user_id = user_id;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone_number = phone_number;
		this.nickname = nickname;
		this.gender = gender;
		this.date_birth = date_birth;
		this.location = location;
		this.create_at = create_at;
		this.email = email;
		this.grade = grade;
		this.question = question;
		this.answer = answer;
	}

}
