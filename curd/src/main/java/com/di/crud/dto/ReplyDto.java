package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class ReplyDto {
	
	// Reply
	private int rno;
	private int bno;
	private int mno;
	private String rcontent;
	private Date rdate;
	private Date rupdate;
	private int rdelelete;

	// page
	private int start_Row;
	private int end_row;
	
}
