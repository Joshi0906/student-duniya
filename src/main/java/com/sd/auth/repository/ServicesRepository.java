package com.sd.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sd.auth.model.Services;

public interface ServicesRepository extends JpaRepository<Services, Long> {
	List<Services> findAll();
}
