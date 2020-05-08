package com.arretadas.api.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Authorities_Contact")
public class AuthoritiesContact {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idcontact;
	
	@NotBlank
	@Size(max=45)
	@Column(name = "name")
	private String name;
	
//	@NotBlank
	@Column(name = "number")
	private int number;
	
	
	public int getIdcontact() {
		return idcontact;
	}
	public void setIdcontact(int idcontact) {
		this.idcontact = idcontact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idcontact;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AuthoritiesContact other = (AuthoritiesContact) obj;
		if (idcontact != other.idcontact)
			return false;
		return true;
	}
	
	
}
