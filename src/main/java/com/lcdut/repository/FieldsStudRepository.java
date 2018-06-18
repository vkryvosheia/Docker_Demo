package com.lcdut.repository;


import com.lcdut.model.FieldsStudModel;
import org.hibernate.validator.internal.engine.resolver.JPATraversableResolver;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FieldsStudRepository extends JpaRepository<FieldsStudModel, Integer>{

}
