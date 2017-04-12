package com.cimstd.hbys.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexCtrl extends BaseWebCtrl {
	
	@RequestMapping("/index")
	public String index(Model model)
	{
		return "index";
	}
}
