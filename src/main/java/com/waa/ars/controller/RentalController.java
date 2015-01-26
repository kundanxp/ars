/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.waa.ars.controller;

import com.waa.ars.domain.Apartment;
import com.waa.ars.domain.Rental;
import com.waa.ars.domain.User;
import com.waa.ars.service.ApartmentService;
import com.waa.ars.service.RentalService;
import com.waa.ars.service.UserService;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RentalController {

    @Autowired
    RentalService rentalService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    ApartmentService apartmentService;
    
    @Secured("ROLE_USER")
    @RequestMapping(value = "/rent/{aptid}", method = RequestMethod.GET)
    public String bookApartment(@PathVariable("aptid") Integer aptid, Rental rental, Principal principal, Model model) {
        
        Apartment apartment = apartmentService.getApartmentById(aptid);
        
        User user = userService.getUserByUsername(principal.getName());
        rental.setApartment(apartment);
        rental.setUser(user);
        model.addAttribute("rental",rental);
        
        return "rental";
    }
    
    
    @Secured("ROLE_USER")
    @RequestMapping(value = "/rent/{aptid}", method = RequestMethod.POST)
    public String bookApartmentSubmit(@ModelAttribute Rental rental, Principal principal, Model model) {
        
        
        return "rental";
    }

}
