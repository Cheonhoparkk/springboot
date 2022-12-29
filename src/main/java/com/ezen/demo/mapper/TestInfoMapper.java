package com.ezen.demo.mapper;

import java.util.List;

import com.ezen.demo.vo.TestInfoVO;

public interface TestInfoMapper {

	List<TestInfoVO> selectTestInfoList(TestInfoVO testInfo);
	TestInfoVO selectTestInfo(TestInfoVO testInfo);
	int insertTestInfo(TestInfoVO testInfo);
	int updateTestInfo(TestInfoVO testInfo);
	int deleteTestInfo(TestInfoVO testInfo);
}
