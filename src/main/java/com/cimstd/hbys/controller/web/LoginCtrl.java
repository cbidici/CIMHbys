package com.cimstd.hbys.controller.web;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cimstd.hbys.util.AppConstants;



@Controller
public class LoginCtrl extends BaseWebCtrl {

	static final Logger LOG = LogManager.getLogger(LoginCtrl.class);
	
	@RequestMapping("/login")
	public String login()
	{
		LOG.info(AppConstants.LOG_INFO + "Call Login controller ");	
		return "login";
	}
}
