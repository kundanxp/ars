/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service.impl;

import com.waa.ars.domain.Apartment;
import com.waa.ars.repository.ApartmentRepository;
import com.waa.ars.service.ApartmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author CKarki
 */

@Service
@Transactional
public class ApartmentServiceImpl implements ApartmentService{
    
    @Autowired
    ApartmentRepository apartRepository;
    
    @Override
    public void addApartment(Apartment apartment) {
        apartRepository.save(apartment); 
    }
    @Override
    public Apartment getApartmentById(Integer apartmentID) {
        return apartRepository.findOne(apartmentID);
    }
    
    public List<Apartment> getAllApartments()
    {
        return apartRepository.findAll();
    }
}
