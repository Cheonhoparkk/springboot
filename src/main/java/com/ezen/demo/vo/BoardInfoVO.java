package com.ezen.demo.vo;

import lombok.Data;

@Data
public class BoardInfoVO {

	private Integer biNum;
	private String biTitle;
	private String biContent;
	private String biWriter;
	private String credat;
	private String moddat;
	private int biCnt;
	private String searchType;
	private String searchText;
}
