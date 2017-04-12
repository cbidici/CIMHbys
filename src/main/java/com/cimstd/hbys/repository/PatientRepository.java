package com.cimstd.hbys.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cimstd.hbys.entity.Patient;

public interface PatientRepository extends JpaRepository<Patient, Integer> {

}
