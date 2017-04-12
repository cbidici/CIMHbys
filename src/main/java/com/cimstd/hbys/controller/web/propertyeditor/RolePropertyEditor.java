package com.cimstd.hbys.controller.web.propertyeditor;

import java.beans.PropertyEditorSupport;

import com.cimstd.hbys.entity.Role;

public class RolePropertyEditor extends PropertyEditorSupport {

	
    public void setAsText(String roleId) {
    	Role role = new Role();
    	role.setId(Integer.valueOf(roleId));
    	
    	setValue(role);
    }
}