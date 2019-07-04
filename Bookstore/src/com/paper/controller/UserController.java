package com.paper.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paper.entity.User;
import com.paper.service.impl.UserServiceImpl;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	
	void setUserService(UserServiceImpl userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	ModelAndView login(HttpServletRequest request, HttpServletResponse response, @RequestParam("username") String username, @RequestParam("password") String password) {
		
		User user = new User(0, username, password);
		
		boolean flag = userService.loginCheck(user);
		
		ModelAndView mv = null;
		
		if(flag) {
			mv = new ModelAndView("redirect:/.");
			request.getSession().setAttribute("username", username);
			Cookie cookie = new Cookie("username", username);
			response.addCookie(cookie);
		}else {
			mv = new ModelAndView("jsps/user/login");
			mv.addObject("msg","用户名或密码错误");
		}
		
		return mv;
	}
}