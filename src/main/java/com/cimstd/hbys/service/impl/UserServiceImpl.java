package com.cimstd.hbys.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cimstd.hbys.entity.User;
import com.cimstd.hbys.repository.RoleRepository;
import com.cimstd.hbys.repository.UserRepository;
import com.cimstd.hbys.repository.spec.UserSpec;
import com.cimstd.hbys.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	// public User findOne(int id) {
	// return userRepository.findOne(id);
	// }

	@Override
	@Transactional
	public User findById(int id) {
		User user = userRepository.findOne(id);

		return user;
	}

	@Override
	public User save(User user) {
		//if password is empty should use old password
		if(null != user.getId() && user.getPassword().isEmpty() ){
			User oldUserInfo  =  userRepository.findOne(user.getId());
			user.setPassword(oldUserInfo.getPassword());
		}
		else{
			BCryptPasswordEncoder bEncoder = new BCryptPasswordEncoder();
			user.setPassword(bEncoder.encode(user.getPassword()));
		}
		
		user.setEnabled(true);
		userRepository.save(user);
		return user;
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void delete(int id) {
		userRepository.delete(id);
	}

	@Override
	public Page<User> find(User user, Pageable page) {
		return userRepository.findAll(UserSpec.userSearch(user), page);
	}
	
	@Override
	public void deleteUsersInBatch(List<User> userList) {
		userRepository.deleteInBatch(userList);
	}

	@Override
	public User findByUsernameAndIdNot(String username, Integer id) {
		return userRepository.findByUsernameAndIdNot(username, id);
	}
}
