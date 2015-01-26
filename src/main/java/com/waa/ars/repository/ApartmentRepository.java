/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.repository;

import com.waa.ars.domain.Apartment;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApartmentRepository extends CrudRepository<Apartment, Integer> {

    @Override
    public Apartment findOne(Integer arg0);
    
    @Override
    public List<Apartment> findAll();
    
}
