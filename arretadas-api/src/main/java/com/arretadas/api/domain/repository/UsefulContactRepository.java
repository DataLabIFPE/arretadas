package com.arretadas.api.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.arretadas.api.domain.model.UsefulContacts;

public interface UsefulContactRepository extends JpaRepository<UsefulContacts, Integer> {

}
