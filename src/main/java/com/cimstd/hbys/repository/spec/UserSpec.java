package com.cimstd.hbys.repository.spec;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import com.cimstd.hbys.entity.User;

public class UserSpec {

	public static Specification<User> userSearch(final User user){
		return new Specification<User>(){

			@Override
			public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				
				if(user != null) {
					Predicate p = user.getUsername() != null ? builder.like(root.<String>get("username"), user.getUsername()+"%") : builder.conjunction();
					predicates.add(p);
					p = user.getFirstname() != null ? builder.like(root.<String>get("firstname"), user.getFirstname()+"%") : builder.conjunction();
					predicates.add(p);
					p =  user.getLastname() != null ? builder.like(root.<String>get("lastname"), user.getLastname()+"%") : builder.conjunction();
					predicates.add(p);
				}
				
				return builder.and(predicates.toArray(new Predicate[]{}));
			}
			
		};
		
	}
}
