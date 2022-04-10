package com.sd.auth.web;

import com.sd.auth.model.Data;
import com.sd.auth.model.ServiceData;
import com.sd.auth.model.Services;
import com.sd.auth.model.User;
import com.sd.auth.service.SecurityService;
import com.sd.auth.service.ServicesImpl;
import com.sd.auth.service.ServicesLocationImpl;
import com.sd.auth.service.UserService;
import com.sd.auth.validator.UserValidator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private ServicesImpl servicesImpl;

    @Autowired
    private ServicesLocationImpl servicesLocationImpl;
    
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {
    	model.addAttribute("dataForm", new Data());
    	
    	List<Services> services = servicesImpl.findAll();
    	
    	Map<String, List<String>> map = new HashMap<>();
    	services.forEach(x -> {
    		map.put(x.getServiceName(), Arrays.asList(x.getServiceList().split(",")));
    	});
    	model.addAttribute("services", map);
    	
    	List<String> locations = servicesLocationImpl.findLocation();
    	model.addAttribute("locations", locations);
    	
        return "welcome";
    }
    
    @PostMapping("/services")
    public String services(@ModelAttribute("dataForm") Data data, BindingResult bindingResult, Model model) {
    	
		String serviceProviderList = servicesLocationImpl.findByLocationAndServiceName(data.getLocation(),
				data.getServiceName());

		if(null == serviceProviderList) {
			return "service-providers-not-found";
		}
		
		List<ServiceData> list = new ArrayList<>();
		Arrays.asList(serviceProviderList.split(";")).forEach(x -> {  // This method acts as a bridge between array-based and collection-based APIs,
			ServiceData serviceData = new ServiceData();
			String[] ar = x.split(",");
			serviceData.setName(ar[0]);
			serviceData.setMobNumber(ar[1]);
			serviceData.setImageName(ar[2]);
			list.add(serviceData);
		});
		model.addAttribute("serviceList", list);
        return "service-providers";
    }
    
    
    @GetMapping({"/test"})
    public String test(Model model) {
        return "test";
    }
}
