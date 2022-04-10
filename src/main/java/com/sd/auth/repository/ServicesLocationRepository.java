package com.sd.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sd.auth.model.ServiceLocation;

public interface ServicesLocationRepository extends JpaRepository<ServiceLocation, Long> {
	
	@Query(value = "select distinct location from service_location", nativeQuery = true)
	List<String> findAllLocation();
	
	@Query(value = "select service_provider_list from service_location where location=?1 and service_name=?2", nativeQuery = true)
	String findByLocationAndServiceName(String location, String serviceName);
}
