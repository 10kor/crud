package com.di.crud.dto;

import lombok.Data;
import java.util.Date;

@Data
public class BoardDto {

	// board
	private int bno;
	private int mno;
	private Date bdate;
	private String bsubject;
	private String bcontent;
	private int bcount;
	private int bstate;
	private Date bupdate;
	private Date bdeldate;
	
	// page
	private int startRow;
	private int endRow;
}
