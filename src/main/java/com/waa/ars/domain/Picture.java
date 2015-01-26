/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kunda_000
 */
@Entity(name = "picture")
public class Picture
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String filename;
    
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Apartment apartment;
    
    @Transient
    private MultipartFile imagefile;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getFilename()
    {
        return filename;
    }

    public void setFilename(String filename)
    {
        this.filename = filename;
    }

    public MultipartFile getImagefile()
    {
        return imagefile;
    }

    public void setImagefile(MultipartFile imagefile)
    {
        this.imagefile = imagefile;
    }

    public Apartment getApartment()
    {
        return apartment;
    }

    public void setApartment(Apartment apartment)
    {
        this.apartment = apartment;
    }
    
    
    
    
    
}
