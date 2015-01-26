

package com.waa.ars.service.impl;

import com.waa.ars.domain.Address;
import com.waa.ars.repository.AddressRepository;
import com.waa.ars.service.AddressService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


//@Service
//@Transactional
public class AddressServiceImpl implements AddressService
{
//    @Autowired
    AddressRepository addressRepository;

    @Override
    public List<Address> getAllAddress()
    {
        return addressRepository.getAllAddresses();
        
    }

    @Override
    public void addAddress(Address address)
    {
        
        addressRepository.save(address);
        
    }
    
}
