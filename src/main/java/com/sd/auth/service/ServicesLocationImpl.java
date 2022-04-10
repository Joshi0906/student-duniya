package com.sd.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sd.auth.repository.ServicesLocationRepository;

@Service
public class ServicesLocationImpl {

	@Autowired
	private ServicesLocationRepository servicesLocationRepository;

	public List<String> findLocation(){
		List<String> list = servicesLocationRepository.findAllLocation();
		return list;
	}
	
	public String findByLocationAndServiceName(String location, String serviceName){
		return servicesLocationRepository.findByLocationAndServiceName(location, serviceName);
	}
}
