/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.repository;

import com.waa.ars.domain.Picture;
import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author CKarki
 */
@Repository
public interface PictureRepository extends CrudRepository<Picture, String>{
    
}
