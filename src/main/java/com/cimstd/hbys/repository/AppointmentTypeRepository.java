package com.cimstd.hbys.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cimstd.hbys.entity.AppointmentType;

public interface AppointmentTypeRepository extends JpaRepository<AppointmentType, Integer> {

}
