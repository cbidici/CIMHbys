package com.cimstd.hbys.repository.impl;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;

import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.repository.UserRepository;
import com.cimstd.hbys.repository.UserRepositoryCustom;

public class UserRepositoryImpl implements UserRepositoryCustom {


	@Autowired
	private UserRepository userRepository;

}
