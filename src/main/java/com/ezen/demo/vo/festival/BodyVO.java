package com.ezen.demo.vo.festival;

import lombok.Data;

@Data
public class BodyVO {

	private ItemsVO items;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
}
