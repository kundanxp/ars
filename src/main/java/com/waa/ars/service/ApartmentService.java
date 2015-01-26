/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.waa.ars.service;

import com.waa.ars.domain.Apartment;
import java.util.List;

/**
 *
 * @author CKarki
 */
public interface ApartmentService {

    void addApartment(Apartment apartment);

    Apartment getApartmentById(Integer apartmentID);
    
    public List<Apartment> getAllApartments();
    
    
}
