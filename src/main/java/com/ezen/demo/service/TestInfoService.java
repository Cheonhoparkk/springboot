package com.ezen.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.demo.mapper.TestInfoMapper;
import com.ezen.demo.vo.TestInfoVO;

@Service
public class TestInfoService {
	
	@Autowired
	private TestInfoMapper testInfoMapper;
	public List<TestInfoVO> selectTestInfoList(TestInfoVO testInfo){
		return testInfoMapper.selectTestInfoList(testInfo);
	}
	public TestInfoVO selectTestInfo(TestInfoVO testInfo){
		return testInfoMapper.selectTestInfo(testInfo);
	}
	public int insertTestInfo(TestInfoVO testInfo) {
		return testInfoMapper.insertTestInfo(testInfo);
	}
	public int updateTestInfo(TestInfoVO testInfo) {
		return testInfoMapper.updateTestInfo(testInfo);
	}
	public int deleteTestInfo(TestInfoVO testInfo) {
		return testInfoMapper.deleteTestInfo(testInfo);
	}
}
