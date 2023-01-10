package com.ezen.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;

import com.ezen.demo.vo.Yes24VO;

public interface Yes24Mapper {
	List<Yes24VO> selectYes24List(Yes24VO yes24);
	int insertYes24 (@Param ("yes24List")List<Yes24VO> yes24);
	static List<Yes24VO> selectYes24List() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
