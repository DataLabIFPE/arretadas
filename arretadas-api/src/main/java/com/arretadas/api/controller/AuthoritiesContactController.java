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

import com.arretadas.api.domain.model.AuthoritiesContact;
import com.arretadas.api.domain.repository.AuthoritiesContactRepository;


@RestController
@RequestMapping("/contatosAutoridades")
public class AuthoritiesContactController {
	
	
	@Autowired
	private AuthoritiesContactRepository authoritiesContactRepository;
	
	@GetMapping
	public List<AuthoritiesContact> listar() {
		return authoritiesContactRepository.findAll();
	}
	
	@GetMapping("/{contatosAutoridadesId}")
	public ResponseEntity<AuthoritiesContact> buscar(@PathVariable Integer contatosAutoridadesId) {
		 Optional<AuthoritiesContact> authoritiesContact = authoritiesContactRepository.findById(contatosAutoridadesId);
		 
		 if(authoritiesContact.isPresent()) {
			 return ResponseEntity.ok(authoritiesContact.get());
		 }
		 
		 return ResponseEntity.notFound().build();
	}
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public AuthoritiesContact adicionar(@Valid @RequestBody AuthoritiesContact authoritiesContact) {
		return authoritiesContactRepository.save(authoritiesContact);
	}
	
	@PutMapping("/{contatosAutoridadesId}")
	public ResponseEntity<AuthoritiesContact> atualizar(@Valid @PathVariable Integer contatosAutoridadesId, 
			@RequestBody AuthoritiesContact authoritiesContact){
			
		if(!authoritiesContactRepository.existsById(contatosAutoridadesId)) {
			return ResponseEntity.notFound().build();
		}
		authoritiesContact.setIdcontact(contatosAutoridadesId);
		authoritiesContact = authoritiesContactRepository.save(authoritiesContact);
		return ResponseEntity.ok(authoritiesContact);
	}
	
	@DeleteMapping("/{contatosAutoridadesId}")
	public ResponseEntity<Void> remover(@PathVariable Integer contatosAutoridadesId){
		if(!authoritiesContactRepository.existsById(contatosAutoridadesId)) {
			return ResponseEntity.notFound().build();
		}
		authoritiesContactRepository.deleteById(contatosAutoridadesId);
		
		return ResponseEntity.noContent().build();
	}

}
