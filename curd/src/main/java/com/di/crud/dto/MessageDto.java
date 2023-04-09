package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class MessageDto {
	
	// Message
	private int meno;
	private int send_mno;
	private int rcv_mno;
	private String msubject;
	private String mcontent;
	private Date mdate;
	private int mcheck;

	// page
	private int startRow;
	private int endRow;

}
