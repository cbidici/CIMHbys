package com.cimstd.hbys.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_control")
public class Control extends BaseEntity {

	private static final long serialVersionUID = -5990851872382663050L;

	@Column(name="control_date")
	private Date controlDate;

	@OneToOne
	@JoinColumn(name="creator_fk")
	private User creator;

	@OneToOne
	@JoinColumn(name="responsible_fk")
	private User responsible;

	@Column(name="creation_date")
	private Date creationDate;

	@OneToOne
	@JoinColumn(name="appointment_fk")
	private Appointment appointment;

	@OneToOne
	@JoinColumn(name="examination_fk")
	private Examination examination;
	
	@OneToOne
	@JoinColumn(name="patient_fk")
	private Patient patient;
	
	public Date getControlDate() {
		return controlDate;
	}

	public void setControlDate(Date controlDate) {
		this.controlDate = controlDate;
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

	public Appointment getAppointment() {
		return appointment;
	}

	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}

	public Examination getExamination() {
		return examination;
	}

	public void setExamination(Examination examination) {
		this.examination = examination;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
}
