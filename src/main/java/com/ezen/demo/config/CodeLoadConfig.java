package com.ezen.demo.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ezen.demo.mapper.AddressMapper;
import com.ezen.demo.vo.Dong1VO;
import com.ezen.demo.vo.Gugun1VO;
import com.ezen.demo.vo.Sido1VO;


@Configuration
public class CodeLoadConfig {

	@Autowired
	private AddressMapper addressMapper;
	
	@Bean
	List<Sido1VO> sidoList(){
		return addressMapper.selectSidoListList(null);
	}
	
	@Bean
	List<Gugun1VO> gugunList(){
		return addressMapper.selectGugunList(null);
	}
	
	@Bean
	List<Dong1VO> dongList(){
		return addressMapper.selectDongList(null);
	}
}
