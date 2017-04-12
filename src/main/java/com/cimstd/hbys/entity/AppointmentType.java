package com.cimstd.hbys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_appointment_type")
public class AppointmentType extends BaseEntity{

	private static final long serialVersionUID = 4677435503963081218L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
