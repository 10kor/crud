package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class MemberDto {
	
	// member
	private int mno;
	private String mail;
	private String mpw;
	private int gender;
	private String location;
	private String phone;
	private Date register;
	private int state;
	private Date deldate;
	
	// page
	private int startRow;
	private int endRow;

	// search
	private String search;
	private String keyword;
	
	
}
