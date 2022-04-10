package com.sd.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sd.auth.model.Services;
import com.sd.auth.repository.ServicesRepository;

@Service
public class ServicesImpl {

	@Autowired
	private ServicesRepository servicesRepository;
	
	public List<Services> findAll(){
		return servicesRepository.findAll();
	}
	
}
