/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service.impl;

import com.waa.ars.domain.Picture;
import com.waa.ars.repository.PictureRepository;
import com.waa.ars.service.ApartmentService;
import com.waa.ars.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author CKarki
 */

@Service
@Transactional
public class PictureServiceImpl implements PictureService{
    
    @Autowired
    PictureRepository pictureRepository;
    
    public void savePicture(Picture picture)
    {
        pictureRepository.save(picture);
    }
    
}
