package com.cimstd.hbys.service.system;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cimstd.hbys.repository.RoleRepository;
import com.cimstd.hbys.repository.UserRepository;

@Transactional
@Service
public class InitDBService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@PostConstruct
	public void init()
	{
	
		if(userRepository.findByUsername("admin") == null)
		{
			//BCryptPasswordEncoder bEncoder = new BCryptPasswordEncoder();
			
			/*
			Role roleReader = new Role();
			roleReader.setRole(Constants.ROLE_READER);
			roleRepository.save(roleReader);
			*/
			
			/*
			Role roleAdmin = new Role();
			roleAdmin.setId(1);
			roleAdmin.setRole(Constants.ROLE_ADMIN);
			
			User userAdmin = new User();
			userAdmin.setEmail("cbidici@gmail.com");
			userAdmin.setUsername("admin");
			userAdmin.setPassword(bEncoder.encode("admin"));
			userAdmin.setRoles(new ArrayList<Role>());
			userAdmin.getRoles().add(roleAdmin);
			userAdmin.setEnabled(true);
			userRepository.save(userAdmin);
			*/
		}
		
		
	}
	
}
