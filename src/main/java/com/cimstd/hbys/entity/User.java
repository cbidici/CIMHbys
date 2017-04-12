package com.cimstd.hbys.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.cimstd.hbys.annotation.Phone;
import com.cimstd.hbys.annotation.UniqueUsername;
import com.cimstd.hbys.annotation.UserPassword;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "hbys_user", uniqueConstraints = { @UniqueConstraint(columnNames = { "username" }) })
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@UniqueUsername(message = "{com.cimstd.hbys.entity.User.username.exists}")
@UserPassword( message = "{com.cimstd.hbys.entity.User.password.size}")
public class User extends BaseEntity {

	private static final long serialVersionUID = -2048248012052685735L;

	@Size(min = 5, max = 32, message = "{com.cimstd.hbys.entity.User.username.size}")
	@Column(unique = true)
	private String username;

	@Email(message = "{com.cimstd.hbys.entity.User.email.email}")
	private String email;

	private String password;

	@ManyToMany(fetch = FetchType.EAGER)
	@NotEmpty(message= "{com.cimstd.hbys.entity.User.roles.required}")
	private List<Role> roles;

	private boolean enabled;
	
	@Size(min = 1, max = 256, message = "{com.cimstd.hbys.entity.User.firstname.size}")
	private String firstname;
	
	@Size(min = 1, max = 256, message = "{com.cimstd.hbys.entity.User.lastname.size}")
	private String lastname;
	
	@Phone(message = "{com.cimstd.hbys.entity.User.phone.invalid}")
	private String phone;
	

	@Size(max = 256, message = "{com.cimstd.hbys.entity.User.address.size}")
	private String address;

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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@JsonIgnore
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
