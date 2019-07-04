package com.paper.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForwardController {
	
	@RequestMapping("login")
	String login(){
		return "jsps/user/login";
	}
	
	@RequestMapping("logout")
	String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("username");
		return "redirect:/.";
	}
	
	@RequestMapping("register")
	String register() {
		return "jsps/user/regist";
	}
}