package com.ezen.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.demo.vo.Sido1VO;

@RestController
public class AddressController {

	@Autowired
	private List<Sido1VO> sidoList;
	
	@GetMapping("/sido")
	public List<Sido1VO> getSidoList(){
		return sidoList;
	}
}
