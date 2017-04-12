package com.cimstd.hbys.controller.api;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

public class BaseApiCtrl {

	@ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public List<FieldError> validationError(HttpServletRequest req, MethodArgumentNotValidException e) {
		
        BindingResult result = e.getBindingResult();
        return result.getFieldErrors();
    }
	
	@ExceptionHandler(value = AuthenticationException.class)
	@ResponseStatus(value = HttpStatus.FORBIDDEN)
	@ResponseBody
	public AuthenticationException accessExHandler(HttpServletRequest req, AuthenticationException e) throws Exception
	{
        return e;
	}
	
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
	@ExceptionHandler(value = Exception.class)
	@ResponseBody
	public Exception exHandler(HttpServletRequest req, Exception e) throws Exception
	{
        return e;
	}
}
