/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.service;

/**
 *
 * @author kunda_000
 */
public interface MailService
{
    void sendMail(String to, String subject, String body);
}
