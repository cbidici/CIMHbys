package com.cimstd.hbys.entity;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.SequenceGenerator;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.cimstd.hbys.util.AppConstants;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

@MappedSuperclass
public class BaseEntity implements Serializable {

	private static final long serialVersionUID = -772074004217298629L;

	private static final Logger LOG = LogManager.getLogger(BaseEntity.class);
	
	@Id
	@SequenceGenerator(name = "pk_sequence", sequenceName = "seq_entity_id", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pk_sequence")
	private Integer id;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String toString(){
		
		ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new Hibernate4Module());
        
        String str = null;
        
        try {
        	str = mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			str = e.getMessage();
			LOG.error(AppConstants.LOG_ERROR, e);
		}
        return str;
	}
}
