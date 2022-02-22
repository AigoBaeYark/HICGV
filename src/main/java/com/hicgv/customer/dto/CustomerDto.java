package com.hicgv.customer.dto;

import java.sql.Timestamp;


import lombok.Getter;
import lombok.Setter;
import oracle.sql.BLOB;

@Getter //jsp java
@Setter //DB  @Data 를 사용하면 게터 세터모두 사용한 것과 같음.
public class CustomerDto {

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
	BLOB profile_imge;
	String question;
	String answer;

}
