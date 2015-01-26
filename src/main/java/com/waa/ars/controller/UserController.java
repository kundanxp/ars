/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.waa.ars.controller;

import com.waa.ars.domain.User;
import com.waa.ars.service.UserService;
import com.waa.ars.service.impl.ApplicationMailer;
import java.io.File;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kunda_000
 */

@Controller
@SessionAttributes({"newUser"})
public class UserController
{
    
    @Autowired
    UserService userService;
    
    
    @Autowired
    ApplicationMailer mailService;
       
    @RequestMapping("/register")
    public String register(Model model)
    {
        model.addAttribute("newUser", new User());
        
        return "register";
    }
    
    
    
    
    
    
    @RequestMapping(value = "/register" , method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("newUser") User newUser, BindingResult result, HttpServletRequest request, Model model)
    {
        model.addAttribute("newUser", newUser);
        
        User existingUser = userService.getUserByUsername(newUser.getUsername());

        if(result.hasErrors())
            return "register";
        
        if(existingUser != null)
        {
            model.addAttribute("message", "User Name Already Exists.");
            return "register";
        }
        
        if(newUser.getPassword().length() < 6)
        {
            model.addAttribute("message", "Password Length Must be More than 5 characters");
            return "register";
        }
        
        String md5password = DigestUtils.md5DigestAsHex(newUser.getPassword().getBytes());
        newUser.setPassword(md5password);
        
        MultipartFile loadedPicture = newUser.getPicture();
        
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        String randString = RandomStringUtils.randomAlphanumeric(10);
        
        if(loadedPicture != null && !loadedPicture.isEmpty())
        {
            try
            {
                
                String newfilename = newUser.getUsername() + "_" + randString + ".jpg";
                
                loadedPicture.transferTo(new File(rootDirectory+"\\resources\\userpics\\"+newfilename));
                
                newUser.setProfileImage(newfilename);
                
            } catch (Exception ex){
                throw new RuntimeException("Product Image saving failed", ex);
            }
        }
        
        
        newUser.setVerificationCode(randString);
        newUser.setEnabled(true);
        
        if(newUser.getUsername().equals("admin"))
            newUser.setRole("ROLE_ADMIN");
        else
            newUser.setRole("ROLE_USER");

        
        try{
            userService.registerUser(newUser); 
        }catch(Exception e){
            System.out.println("User Registration Failed");
        }
        
        model.addAttribute("message", "User Registration Success. Please Login.");
        
        return "redirect:/login";
    }
    
    
    
    
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping("/profile")
    public String userProfile(Principal principal, Model model)
    {
        
        model.addAttribute("newUser", userService.getUserByUsername(principal.getName()));
        
        return "profile";
    }
    
    
    
    
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping(value = "/profile/edit", method = RequestMethod.GET)
    public String editProfile(@ModelAttribute("newUser") User user, Model model)
    {
        
        model.addAttribute("newUser", user);
        model.addAttribute("editMode", true);
        
        return "register";
    }
    
    
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping(value = "/profile/edit", method = RequestMethod.POST)
    public String updateProfile(@ModelAttribute("newUser") User user, BindingResult result, 
            HttpServletRequest request, Model model)
    {
        if(result.hasErrors())
            return "register";
        
        MultipartFile loadedPicture = user.getPicture();
        
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        String randString = RandomStringUtils.randomAlphanumeric(10);
        
        if(loadedPicture != null && !loadedPicture.isEmpty())
        {
            try
            {
                String newfilename = user.getUsername() + "_" + randString + ".jpg";
                
                loadedPicture.transferTo(new File(rootDirectory+"\\resources\\userpics\\"+newfilename));
                
                user.setProfileImage(newfilename);
                
            } catch (Exception ex){
                throw new RuntimeException("Product Image saving failed", ex);
            }
        }
        
        userService.registerUser(user);
        
        return "redirect:/profile";
    }
    
    
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping(value = "/profile/password", method = RequestMethod.GET)
    public String changePassword(@ModelAttribute("newUser") User user, Model model)
    {
        model.addAttribute("newUser", user);
        
        return "password";
    }
    
    @Secured({"ROLE_USER","ROLE_ADMIN"})
    @RequestMapping(value = "/profile/password", method = RequestMethod.POST)
    public String changePasswordSubmit(@ModelAttribute("newUser") User user,
            @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword,
            @RequestParam("newPasswordTwo") String newPasswordTwo, Model model)
    {
        
        String message = "";
        
        String md5passwordOld = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
        
        if(md5passwordOld.equals(user.getPassword()))
        {
            if(newPassword.equals(newPasswordTwo)){
                
                String md5passwordNew = DigestUtils.md5DigestAsHex(newPassword.getBytes());
                user.setPassword(md5passwordNew);
                userService.registerUser(user);
                message = "Password Changed Successfully";
                
            }else{
                message = "New Password Not matched";
            }
            
        }else{
            message = "Old Password is Wrong";
        }
        
        model.addAttribute("message", message);
        
        
        if(message.equals("Password Changed Successfully"))
            return "password";
        else
        {
           model.addAttribute("oldPassword", oldPassword);
           model.addAttribute("newPassword", newPassword);
           model.addAttribute("newPasswordTwo", newPasswordTwo);
           return "password";
        }
    }
    
    
    
    
    @RequestMapping(value = "/user/apartments", method = RequestMethod.GET)
    public String userApartments(Principal principal, Model model)
    {
        
        model.addAttribute("apartments", userService.getUserByUsername(principal.getName()).getApartments());
        
        return "apartments";
    }
    
    
    
    
    
}
