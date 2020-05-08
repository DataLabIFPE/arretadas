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

import com.arretadas.api.domain.model.UsefulContacts;
import com.arretadas.api.domain.repository.UsefulContactRepository;


@RestController
@RequestMapping("/contatosUteis")
public class UsefulContactController {
	
	@Autowired
	private UsefulContactRepository usefulContactRepository;
	
	@GetMapping
	public List<UsefulContacts> listar() {
		return usefulContactRepository.findAll();
	}
	
	@GetMapping("/{contatosUteisId}")
	public ResponseEntity<UsefulContacts> buscar(@PathVariable Integer contatosUteisId) {
		 Optional<UsefulContacts> usefulContact = usefulContactRepository.findById(contatosUteisId);
		 
		 if(usefulContact.isPresent()) {
			 return ResponseEntity.ok(usefulContact.get());
		 }
		 
		 return ResponseEntity.notFound().build();
	}
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public UsefulContacts adicionar(@Valid @RequestBody UsefulContacts usefulContact) {
		return usefulContactRepository.save(usefulContact);
	}
	
	@PutMapping("/{contatosUteisId}")
	public ResponseEntity<UsefulContacts> atualizar(@Valid @PathVariable Integer contatosUteisId, 
			@RequestBody UsefulContacts usefulContact){
			
		if(!usefulContactRepository.existsById(contatosUteisId)) {
			return ResponseEntity.notFound().build();
		}
		usefulContact.setIdcontact(contatosUteisId);
		usefulContact = usefulContactRepository.save(usefulContact);
		return ResponseEntity.ok(usefulContact);
	}
	
	@DeleteMapping("/{contatosUteisId}")
	public ResponseEntity<Void> remover(@PathVariable Integer contatosUteisId){
		if(!usefulContactRepository.existsById(contatosUteisId)) {
			return ResponseEntity.notFound().build();
		}
		usefulContactRepository.deleteById(contatosUteisId);
		
		return ResponseEntity.noContent().build();
	}

}
