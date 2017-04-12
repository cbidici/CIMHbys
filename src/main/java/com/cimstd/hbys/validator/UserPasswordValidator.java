package com.cimstd.hbys.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.cimstd.hbys.annotation.UniqueUsername;
import com.cimstd.hbys.annotation.UserPassword;
import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.service.UserService;

public class UserPasswordValidator implements ConstraintValidator<UserPassword, User> {

	@Override
	public void initialize(UserPassword arg0) {
		
	}
	
	@Override
	public boolean isValid(User user, ConstraintValidatorContext context) {
		
		return true;
	}

	

}
