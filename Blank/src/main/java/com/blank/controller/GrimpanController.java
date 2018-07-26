package com.blank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blank.dao.GrimpanDao;

@Controller
public class GrimpanController {

	private GrimpanDao dao;

	public void setDao(GrimpanDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/member/grimpan.do")
	public void grimpan() {

	}

}
