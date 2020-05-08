package com.arretadas.api.controller;


import java.util.List;
import java.util.Optional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.arretadas.api.domain.model.User;
import com.arretadas.api.domain.repository.UserRepository;

@RestController
@RequestMapping("/user")
public class UserController {
	
	
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping
	public List<User> listar() {
		return userRepository.findAll();
	}
	
	@GetMapping("/{userId}")
	public ResponseEntity<User> buscar(@PathVariable Integer userId) {
		 Optional<User> user = userRepository.findById(userId);
		 
		 if(user.isPresent()) {
			 return ResponseEntity.ok(user.get());
		 }
		 
		 return ResponseEntity.notFound().build();
	}
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public User adicionar(@Valid @RequestBody User user) {
		return userRepository.save(user);
	}
	
	@PutMapping("/{userId}")
	public ResponseEntity<User> atualizar(@Valid @PathVariable Integer userId, 
			@RequestBody User user){
			
		if(!userRepository.existsById(userId)) {
			return ResponseEntity.notFound().build();
		}
		user.setId(userId);
		user = userRepository.save(user);
		return ResponseEntity.ok(user);
	}
	
	@DeleteMapping("/{userId}")
	public ResponseEntity<Void> remover(@PathVariable Integer userId){
		if(!userRepository.existsById(userId)) {
			return ResponseEntity.notFound().build();
		}
		userRepository.deleteById(userId);
		
		return ResponseEntity.noContent().build();
	}
}
