package com.ezen.demo.mapper;

import java.util.List;

import com.ezen.demo.vo.Dong1VO;
import com.ezen.demo.vo.Gugun1VO;
import com.ezen.demo.vo.Sido1VO;

public interface AddressMapper {

	List<Sido1VO> selectSidoListList(Sido1VO sido);
	List<Gugun1VO> selectGugunList(Gugun1VO gugun);
	List<Dong1VO> selectDongList(Dong1VO dong);
}
