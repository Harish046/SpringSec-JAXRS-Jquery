package com.github.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmployeeController {
	
	@RequestMapping(value = "/listusers", method = RequestMethod.GET)
	public String listUsers() {
		return "listusers";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteUsers() {
		return "deleteuser";
	}
	@RequestMapping(value = "/adduser", method = RequestMethod.GET)
	public String addUser() {
		return "adduser";
	}
	
	@RequestMapping(value = "/file/upload", method=RequestMethod.GET) 
	public String uploadPage(Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
			model.addAttribute("username", userDetail.getUsername());
		  }
		return "fileupload";
	}
	@RequestMapping(value = "/edituser", method = RequestMethod.GET)
	public String editUser(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		  if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
			model.addAttribute("username", userDetail.getUsername());
		  }
		return "edituser";
	}

}
