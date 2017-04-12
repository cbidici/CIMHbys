package com.cimstd.hbys.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.cimstd.hbys.entity.User;


public interface UserService {
	
	public List<User> findAll();
	
	public User findById(int id);
	
	public User save(User user);
	
	public User findByUsername(String username);
	
	public void delete(int id);
	
	public Page<User> find(User user, Pageable page);
	
	public void deleteUsersInBatch(List<User> userList);

	public User findByUsernameAndIdNot(String username, Integer id);
	
}
