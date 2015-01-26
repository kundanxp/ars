/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service;

import com.waa.ars.domain.User;

/**
 *
 * @author kunda_000
 */
public interface UserService
{
    void registerUser(User user);
    User getUserByUsername(String username);
}
