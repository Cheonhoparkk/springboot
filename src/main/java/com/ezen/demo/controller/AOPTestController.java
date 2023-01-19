package com.ezen.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AOPTestController {

	@GetMapping("/test1")
	public String goTestPage() {
		return "views/test1";
	}
	
	@GetMapping("/views/test1")
	public void goTestPage2() {
		
	}
	
	@GetMapping("/test2")
	@ResponseBody
	public String sendJson() {
		return "views/test1";
	}
}
