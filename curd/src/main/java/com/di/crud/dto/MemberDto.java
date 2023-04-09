package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class MemberDto {
	
	// member
	private int mno;
	private String mail;
	private String mpw;
	private String gender;
	private String address1;
	private String address2;
	private String phone;
	private Date register;
	private String state;
	private String delete;
	private Date deldate;
	
	// page
	private int start_Row;
	private int end_row;

	// search
	private String search;
	private String keyword;
	
	
}
