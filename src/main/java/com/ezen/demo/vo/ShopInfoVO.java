package com.ezen.demo.vo;

import lombok.Data;

@Data
public class ShopInfoVO {

	private int siNum;
	private String siCode;
	private String siName;
	private String siCategory;
	private int siStock;
	private String siSupplier;
	private int siPrice;
	private String siEtc;
	private String searchType;
	private String searchText;
}
