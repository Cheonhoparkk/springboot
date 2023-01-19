package com.ezen.demo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.PropertySource;

import com.ezen.demo.api.ApiFestivalInfo;
import com.ezen.demo.vo.festival.FestivalResultVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
@PropertySource("classpath:env.properties")
class DemoApplicationTests {
	@Value("${data.url}")
	private String dataUrl;
	@Autowired
	private ApiFestivalInfo apiFestivalInfo;
	@Autowired
	private ApiFestivalInfo festivalInformationMapper;
	
	@Test
	void contextLoads() {
		String searchFestivalUrl = "/searchFestival?serviceKey=0NgZecrhncazi8yhHRY9aF2rS%2BGPsSLhDWiDuveMYS5LAvR%2FKGY7NGpCTnFoS1yHexFZYzuFNgTDfonYyB3XxQ%3D%3D&numOfRows=1000&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&eventStartDate=20220601";
		FestivalResultVO festivalResult = apiFestivalInfo.getData(dataUrl + searchFestivalUrl, FestivalResultVO.class);
		log.debug("festivalResult=>{}",festivalResult);
	}
	}

