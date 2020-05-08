package com.arretadas.api.domain.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.arretadas.api.domain.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
