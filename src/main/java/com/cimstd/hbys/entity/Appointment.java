package com.cimstd.hbys.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_appointment")
public class Appointment extends BaseEntity {

	private static final long serialVersionUID = 2300623824870255246L;

	@Column(name="appointment_date")
	private Date appointmentDate;

	@OneToOne
	@JoinColumn(name="creator_fk")
	private User creator;

	@OneToOne
	@JoinColumn(name="responsible_fk")
	private User responsible;

	@Column(name="creation_date")
	private Date creationDate;

//	@OneToOne
//	@JoinColumn(name="examination_fk")
//	private Examination examination;

	@OneToOne
	@JoinColumn(name="patient_fk")
	private Patient patient;

//	@OneToOne
//	@JoinColumn(name=)
//	private Control control;
	
	@OneToOne
	@JoinColumn(name="type_fk")
	private AppointmentType type;

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public User getResponsible() {
		return responsible;
	}

	public void setResponsible(User responsible) {
		this.responsible = responsible;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public AppointmentType getType() {
		return type;
	}

	public void setType(AppointmentType type) {
		this.type = type;
	}
	
}
