package com.cimstd.hbys.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "hbys_examination")
public class Examination extends BaseEntity {

	private static final long serialVersionUID = 4885651827370923146L;

	@Column(name="examination_date")
	private Date examinationDate;

	@OneToOne
	@JoinColumn(name="creator_fk")
	private User creator;

	@OneToOne
	@JoinColumn(name="responsible_fk")
	private User responsible;

	@Column(name="creation_date")
	private Date creationDate;

	private Double price;

	@OneToOne
	@JoinColumn(name="appointment_fk")
	private Appointment appointment;

	@OneToOne
	@JoinColumn(name="patient_fk")
	private Patient patient;

	//@OneToMany
	//private List<Control> controlList;
	
	public Date getExaminationDate() {
		return examinationDate;
	}

	public void setExaminationDate(Date examinationDate) {
		this.examinationDate = examinationDate;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Appointment getAppointment() {
		return appointment;
	}

	public void setAppointment(Appointment appointment) {
		this.appointment = appointment;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
}
