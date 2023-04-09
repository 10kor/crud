package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class Re_ReplyDto {
	
	// Re_Reply
	private int rrno;
	private int rno;
	private int mno;
	private String rrcontent;
	private Date rrdate;
	private Date rrupdate;
	private int rrdelete;

	// page
	private int startRow;
	private int endRow;
	
}
