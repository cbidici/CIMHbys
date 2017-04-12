package com.cimstd.hbys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "hbys_patient")
public class Patient extends BaseEntity {

	private static final long serialVersionUID = -4527715937005460912L;

	@Size(min = 1, max = 256)
	private String firstname;

	@Size(min = 1, max = 256)
	private String lastname;

	private String phone;

	private String address;
	
//	@OneToMany
//	private List<Appointment> appointmentList;
//
//	@OneToMany
//	private List<Examination> examinationList;
//
//	@OneToMany
//	private List<Control> controlList;

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
