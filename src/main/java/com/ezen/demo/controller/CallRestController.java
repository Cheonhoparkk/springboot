package com.ezen.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.ezen.demo.vo.AsyncVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CallRestController {

	private static final String url = "http://192.168.0.31/async/";
	
	@Autowired
	private ObjectMapper om;
	
	@GetMapping("/call/{cnt}")
	public AsyncVO getCall(@PathVariable("cnt") int cnt) throws JsonMappingException, JsonProcessingException {
		RestTemplate rest = new RestTemplate();
		ResponseEntity<String> res = rest.getForEntity(url + cnt + "/박진영", String.class);
		AsyncVO async = om.readValue(res.getBody(), AsyncVO.class);
		return async;
	}
	
	@GetMapping("/hook/{key}")
	public void hook(@PathVariable("key")String key) {
		log.debug("key=>{}", key);
	}
}
