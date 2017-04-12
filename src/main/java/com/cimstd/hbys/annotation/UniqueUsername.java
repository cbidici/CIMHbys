package com.cimstd.hbys.annotation;

import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.cimstd.hbys.validator.UniqueUsernameValidator;

@Target({ TYPE })
@Retention(RUNTIME)
@Constraint(validatedBy = { UniqueUsernameValidator.class })
public @interface UniqueUsername {

	String message();
	
	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};	
}
