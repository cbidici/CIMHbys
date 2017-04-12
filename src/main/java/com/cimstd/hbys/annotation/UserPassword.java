package com.cimstd.hbys.annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.cimstd.hbys.validator.PhoneValidator;
import com.cimstd.hbys.validator.UserPasswordValidator;

@Constraint(validatedBy = UserPasswordValidator.class)
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface UserPassword {

	String message();

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

}