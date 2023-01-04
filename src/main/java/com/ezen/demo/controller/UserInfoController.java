package com.ezen.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.demo.service.UserInfoService;
import com.ezen.demo.vo.UserInfoVO;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoService userInfoService;
	
	@GetMapping("/user-infos")
	public String getUserInfos(Model model, @ModelAttribute UserInfoVO userInfo) {
		model.addAttribute("userList",userInfoService.getUserInfos(userInfo));
		return "views/user-info/list";
	}
	
	@GetMapping("/user-infos/check/{uiId}")
	@ResponseBody
	public boolean existUserId(@PathVariable("uiId")String uiId) {
		return userInfoService.existUserId(uiId);
	}
	@PostMapping("/user-infos")
	public @ResponseBody int addUserInfo(@RequestBody UserInfoVO userInfo) {
		return userInfoService.insertUserInfo(userInfo);
	}
	@PostMapping("/user-infos/{uiNum}")
	public  @ResponseBody boolean checkPassword(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum) {
		return userInfoService.checkPassword(userInfo, uiNum);
	}
	
	@DeleteMapping("/user-infos/{uiNum}")
		public  @ResponseBody boolean removePassword(@RequestBody UserInfoVO userInfo, @PathVariable("uiNum") int uiNum) {
			return userInfoService.removeUserInfo(userInfo, uiNum);
	}
	
	@PostMapping("/login")
	public @ResponseBody UserInfoVO login(@RequestBody UserInfoVO userInfo, HttpSession session) {
		UserInfoVO loginUserInfo = userInfoService.login(userInfo);
		if(loginUserInfo !=null) {
			session.setAttribute("userInfo", loginUserInfo);
			loginUserInfo.setUiPwd(null);
		}
		return loginUserInfo;
	}
	
}
