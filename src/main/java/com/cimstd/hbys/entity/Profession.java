package com.cimstd.hbys.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_profession")
public class Profession extends BaseEntity {

	private static final long serialVersionUID = 3910692441240623870L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
