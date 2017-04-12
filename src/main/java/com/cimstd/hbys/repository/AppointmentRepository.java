package com.cimstd.hbys.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cimstd.hbys.entity.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, Integer> {

}
