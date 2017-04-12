package com.cimstd.hbys.controller.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cimstd.hbys.controller.api.domain.PageableContentDO;
import com.cimstd.hbys.controller.web.propertyeditor.RolePropertyEditor;
import com.cimstd.hbys.entity.Role;
import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.service.RoleService;
import com.cimstd.hbys.service.UserService;

@Controller
@RequestMapping("/users")
public class UserCtrl extends BaseWebCtrl {

	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Role.class, new RolePropertyEditor());
	}

	@ModelAttribute("searchUser")
	public PageableContentDO<User> constructSearchUser(HttpSession session){
		@SuppressWarnings("unchecked")
		PageableContentDO<User> searchUser = (PageableContentDO<User>) session.getAttribute("searchUser");
		if(searchUser == null) {
			searchUser = new PageableContentDO<User>();
			searchUser.setDomain(new User());
		}
		return searchUser;
	}
	
	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}
	
	@RequestMapping
	public String users(Model model, HttpSession session) {
		
		PageableContentDO<User> searchUser = new PageableContentDO<User>();
		searchUser.setDomain(new User());
		
		return search(model, searchUser, session);
	}

	@RequestMapping("/{id}")
	public String userDetail(Model model, @PathVariable int id) {
		model.addAttribute("user", userService.findById(id));
		return "userdetail";
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removeUser(@ModelAttribute("userIdList") String userIdList) {
		
		return "redirect:/users.html";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String doRegister(Model model, @Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes redirectAttributes, HttpSession session) {
		if(result.hasErrors())
		{
			model.addAttribute("register", "fail");
			
			return users(model, session);
		}
		userService.save(user);
		redirectAttributes.addFlashAttribute("register", "success");
		return "redirect:/users.html";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, @ModelAttribute("searchUser") PageableContentDO<User> searchUser, HttpSession session) {
		searchUser.setPageIndex(0);
		searchUser.setPage(userService.find(searchUser.getDomain(), searchUser.getPageRequest()));
	    model.addAttribute("searchUser", searchUser);
		model.addAttribute("roles", roleService.findAll());
		session.setAttribute("searchUser", searchUser);
		return "users";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam int pdx, @RequestParam int psz, @RequestParam String sdr, @RequestParam String sky, HttpSession session) {

		String result = "users";
		
		@SuppressWarnings("unchecked")
		PageableContentDO<User> searchUser = (PageableContentDO<User>) session.getAttribute("searchUser");
		
		if(searchUser == null) {
			result = users(model, session);
		}
		else{
			searchUser.setPageIndex(pdx);
			searchUser.setPageSize(psz);
			searchUser.setSortDirection(sdr);
			searchUser.setSortKey(sky);
			searchUser.setPage(userService.find(searchUser.getDomain(), searchUser.getPageRequest()));
			model.addAttribute("searchUser", searchUser);
			model.addAttribute("roles", roleService.findAll());
		}
		return result;
	}

}
