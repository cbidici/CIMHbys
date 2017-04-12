package com.cimstd.hbys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cimstd.hbys.entity.Role;
import com.cimstd.hbys.repository.RoleRepository;
import com.cimstd.hbys.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public List<Role> findAll() {
		return roleRepository.findAll();
	}
	
}
