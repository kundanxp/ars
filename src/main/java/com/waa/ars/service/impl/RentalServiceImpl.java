/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service.impl;

import com.waa.ars.domain.Rental;
import com.waa.ars.repository.RentalRepository;
import com.waa.ars.service.RentalService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RentalServiceImpl implements RentalService {
    
    @Autowired
    RentalRepository rentalRepository; 

//    @Override
//    public List<RentalInfo> findAll() {
//        
//        return  rentalInfoRepository.findAll();
//    }
//
//    @Override
//    public RentalInfo findOne(String rentalInfoID) {
//        return rentalInfoRepository.findOne(rentalInfoID);
//    }

    public void saveRental(Rental rental)
    {
        rentalRepository.save(rental);
    }
    
    
}
