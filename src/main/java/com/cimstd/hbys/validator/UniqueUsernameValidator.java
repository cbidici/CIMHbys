package com.cimstd.hbys.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.cimstd.hbys.annotation.UniqueUsername;
import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.service.UserService;

public class UniqueUsernameValidator implements ConstraintValidator<UniqueUsername, User> {

	@Autowired
	UserService userService;
	
	@Override
	public boolean isValid(User user, ConstraintValidatorContext context) {
		if(null == userService)
		{
			return true;
		}
		
		User userDB = null;
		
		if(user.getId() == null){
			userDB = userService.findByUsername(user.getUsername());
		}
		else{
			userDB = userService.findByUsernameAndIdNot(user.getUsername(), user.getId());
		}
		
		return null == userDB ? true : false;
		
	}

	@Override
	public void initialize(UniqueUsername arg0) {
		
	}

}
