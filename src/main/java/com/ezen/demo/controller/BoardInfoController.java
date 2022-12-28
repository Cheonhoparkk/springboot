package com.ezen.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ezen.demo.service.BoardInfoService;
import com.ezen.demo.vo.BoardInfoVO;

@Controller
public class BoardInfoController {
	
	@Autowired
	private BoardInfoService boardInfoService;
	
	@GetMapping("/board-infos")
	public String getBoardInfos(Model model, @ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("boardList", boardInfoService.getBoardInfos(boardInfo));
		return "views/board-info/list";
	}
	@GetMapping("/board-info")
	public String getBoardInfo(Model model,@ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("boardInfo",boardInfoService.getBoardInfo(boardInfo));
		return "views/board-info/view";
	}

	@GetMapping("/board-info/update")
	public String getBoardInfo2(Model model,@ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("boardInfo",boardInfoService.getBoardInfo(boardInfo));
		return "views/board-info/update";
	}
	@PostMapping("/board-infos/insert")
	public String insertBoardInfo(Model model,@ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("msg","게시글 등록이 완료되었습니다.");
		model.addAttribute("url","/board-infos");
		if(boardInfoService.insertBoardInfo(boardInfo)!=1) {
			model.addAttribute("msg","게시글 등록이 실패하였습니다.");
			model.addAttribute("url","/views/board-info/insert");
		}
		return "views/common/msg";
	}
	@PostMapping("/board-infos/update")
	public String updateBoardInfo(Model model,@ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("msg","게시글 수정이 완료되었습니다.");
		model.addAttribute("url","/board-infos");
		if(boardInfoService.updateBoardInfo(boardInfo)!=1) {
			model.addAttribute("msg","게시글 수정이 실패하였습니다.");
			model.addAttribute("url","/board-info/update?biNum=" + boardInfo.getBiNum());
		}
		return "views/common/msg";
	}
	@PostMapping("/board-infos/delete")
	public String deleteBoardInfo(Model model,@ModelAttribute BoardInfoVO boardInfo) {
		model.addAttribute("msg","게시글 삭제가 완료되었습니다.");
		model.addAttribute("url","/board-infos");
		if(boardInfoService.deleteBoardInfo(boardInfo.getBiNum())!=1) {
			model.addAttribute("msg","게시글 삭제가 실패하였습니다.");
			model.addAttribute("url","/board-info/update?biNum=" + boardInfo.getBiNum());
		}
		return "views/common/msg";
}
}
