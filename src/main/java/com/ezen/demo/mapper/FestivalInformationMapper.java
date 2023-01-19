package com.ezen.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ezen.demo.vo.festival.FestivalInformationVO;

@Mapper
	public interface FestivalInformationMapper {
		int insertFestivalInformations(@Param("FestivalInfoList") List<FestivalInformationVO> FestivalInfoList);

		int insertFestivalInformation(FestivalInformationVO festivalInfo);
		
		FestivalInformationVO selectFestivalInformation(String contentId);
		
		int updateFestivalInformation(FestivalInformationVO festivalInfo);
	}
