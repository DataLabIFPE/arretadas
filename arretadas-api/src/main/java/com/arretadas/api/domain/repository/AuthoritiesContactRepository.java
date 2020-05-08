package com.arretadas.api.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arretadas.api.domain.model.AuthoritiesContact;

@Repository
public interface AuthoritiesContactRepository extends JpaRepository<AuthoritiesContact, Integer> {

}
