package com.example.demo.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.config.JwtService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "http://localhost:3000")
public class UserController {
    
    @Autowired private UserService service;
    @Autowired private JwtService jwtService;
    @Autowired AuthenticationManager authenticationManager;

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @PostMapping("/register")
    public User saveUser(@Valid @RequestBody User user){
        logger.info("Controller method called");
        return service.saveUser(user);
    }

    
    @PostMapping("/login")
    public UserDTO login(@Valid @RequestBody User user, HttpServletRequest request){
        
        Authentication authentication = authenticationManager
            .authenticate(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));

        logger.info("Verifying user credentials...");
        
        if(authentication.isAuthenticated()) {
            logger.info("user verified. Creating JWT token...");
            String token = jwtService.createToken(user.getUsername());

            UserDTO userDTO = new UserDTO();
            userDTO.setJwtToken(token);

            return userDTO;
        }
        else return new UserDTO();
    }
    
}
