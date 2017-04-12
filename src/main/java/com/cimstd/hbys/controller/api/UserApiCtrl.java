package com.cimstd.hbys.controller.api;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cimstd.hbys.controller.api.domain.PageableContentDO;
import com.cimstd.hbys.entity.Role;
import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.service.RoleService;
import com.cimstd.hbys.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserApiCtrl extends BaseApiCtrl {

	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public User getUser(Model model, @PathVariable int id) {
		User user = userService.findById(id);
		return user;
	}
	
	@RequestMapping("/register/available")
	@ResponseBody
	public String available(@RequestParam String username,@RequestParam Integer userId)
	{
		
		User user = userService.findByUsername(username);
		Boolean available =  null != user && !user.getId().equals(userId)?false:true;
		return available.toString();
	}

	@RequestMapping("/search")
	@ResponseBody
	public PageableContentDO<User> search(@RequestBody PageableContentDO<User> pageable){
		pageable.setPage(userService.find(pageable.getDomain(), pageable.getPageRequest()));
		return pageable;
	}
	
	@RequestMapping("/roles")
	@ResponseBody
	@Secured(value="permitAll")
	public List<Role> getRoles(){
		return roleService.findAll();
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
	public User user(@Valid @RequestBody User user){
		return userService.save(user);
	}
}
