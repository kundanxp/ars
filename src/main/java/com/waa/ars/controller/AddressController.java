

package com.waa.ars.controller;

import com.waa.ars.domain.Address;
import com.waa.ars.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
//@RequestMapping("/address")
public class AddressController
{
//    @Autowired
    AddressService addressService;
    
    @RequestMapping()
    public String address()
    {
        return "address";
    }
    
    @RequestMapping("/add")
    public String addAddress(Model model)
    {
        model.addAttribute("address",new Address());
        
        return "addressForm";
    }
    
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addAddress(@ModelAttribute("address") Address address, Model model)
    {
//        model.addAttribute("address",address);
        addressService.addAddress(address);
        return "redirect:/address";
    }
    
}
