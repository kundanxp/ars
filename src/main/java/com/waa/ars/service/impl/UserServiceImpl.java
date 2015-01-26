/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service.impl;

import com.waa.ars.domain.User;
import com.waa.ars.repository.UserRepository;
import com.waa.ars.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kunda_000
 */
@Service
@Transactional
public class UserServiceImpl implements UserService
{

    @Autowired
    UserRepository userRepository;
    
    @Override
    public void registerUser(User user)
    {
        userRepository.save(user);
        
    }

    @Override
    public User getUserByUsername(String username)
    {
        return userRepository.getUserByUsername(username);
    }

    
    
    
    
}
