package com.cimstd.hbys.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cimstd.hbys.entity.User;


public interface UserRepository extends JpaRepository<User, Integer>, UserRepositoryCustom {

	User findByUsername(String username);

	Page<User> findAll(Specification<User> userSearch, Pageable page);

	User findByUsernameAndIdNot(String username, Integer id);

}
