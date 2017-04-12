package com.cimstd.hbys.entity;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_doctor")
public class Doctor extends User {

	private static final long serialVersionUID = -8512201359232510488L;
	
	@OneToOne
	private Profession profession;

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

}
