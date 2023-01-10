package com.ezen.demo.vo;

import lombok.Data;

@Data
public class ResultVO {
	private String srclangType;
	private String tarLangType;
	private String translatedText;
	private String engineType;
	private String pivot;
	private String dict;
	private String tarDict;
}
