package com.cimstd.hbys.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cimstd.hbys.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByRole(String role);

}
