package com.ezen.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ezen.demo.crawl.Yes24Crawling;
import com.ezen.demo.mapper.Yes24Mapper;
import com.ezen.demo.vo.Yes24VO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class DemoApplicationTests {

	@Autowired
	private Yes24Crawling yes24;
	
	@Autowired
	private Yes24Mapper yes24Mapper;
	
	@Test
	void contextLoads() {
		
		
		

	}
	}

