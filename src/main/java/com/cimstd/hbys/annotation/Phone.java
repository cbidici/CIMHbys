package com.cimstd.hbys.annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.ElementType;
import java.lang.annotation.RetentionPolicy;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.cimstd.hbys.validator.PhoneValidator;

@Constraint(validatedBy = PhoneValidator.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface Phone {


   String message() default "{Phone}";

   Class<?>[] groups() default {};

   Class<? extends Payload>[] payload() default {};

}