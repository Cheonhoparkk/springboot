package com.ezen.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.demo.vo.AddressVO;
import com.ezen.demo.vo.Dong1VO;
import com.ezen.demo.vo.Gugun1VO;
import com.ezen.demo.vo.Sido1VO;

@RestController
public class AddressController {

	@Autowired
	private List<Sido1VO> sidoList;

	@Autowired
	private List<Gugun1VO> gugunList;

	@Autowired
	private List<Dong1VO> dongList;
	
	@GetMapping("/sido")
	public List<Sido1VO> getSidoList(){
		return sidoList;
	}
	@GetMapping("/gugun/{siNum}")
	public List<Gugun1VO> getGugunList(@PathVariable int siNum){
		List<Gugun1VO> tmpGugunList = new ArrayList<>();
		for(Gugun1VO gugun : gugunList) {
			if(gugun.getSiNum()==siNum) {
				tmpGugunList.add(gugun);
			}
		}
		return gugunList;
	}
	
	@GetMapping("/dong/{doNum}")
	public List<Dong1VO> getDongList(@PathVariable int guNum){
		return dongList.stream().filter(dong->dong.getGuNum() == guNum).collect(Collectors.toList());
	}

	@GetMapping("/address")
	public AddressVO getAddressList(AddressVO addressVO){
		addressVO.setSidoList(sidoList);
		addressVO.setGugunList(gugunList);
		addressVO.setDongList(dongList);
		return addressVO;
	}
}
