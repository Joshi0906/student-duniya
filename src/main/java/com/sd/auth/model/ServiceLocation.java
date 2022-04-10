package com.sd.auth.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "service_location")
public class ServiceLocation {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int serviceLocationId;

	@Column
	private String serviceName;
	
	@Column
	private String serviceProviderList;
	
	@Column
	private String location;

	public int getServiceLocationId() {
		return serviceLocationId;
	}

	public void setServiceLocationId(int serviceLocationId) {
		this.serviceLocationId = serviceLocationId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceProviderList() {
		return serviceProviderList;
	}

	public void setServiceProviderList(String serviceProviderList) {
		this.serviceProviderList = serviceProviderList;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
}
