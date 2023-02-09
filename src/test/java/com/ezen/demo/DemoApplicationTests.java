package com.ezen.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;

import com.ezen.demo.vo.festival.FestivalResultVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
@PropertySource("classpath:env.properties")
class DemoApplicationTests {
	@Value("${data.url}")
	private String dataUrl;

	
	}

