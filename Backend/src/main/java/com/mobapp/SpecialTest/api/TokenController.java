package com.mobapp.SpecialTest.api;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mobapp.SpecialTest.models.Role;
import com.mobapp.SpecialTest.models.User;
import com.mobapp.SpecialTest.services.UserServiceImplementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController @Slf4j 
public class TokenController {

    @Autowired
    UserServiceImplementation userServiceImplementation;
    
    @GetMapping("/token/refresh")
    public void refreshToken(HttpServletRequest request, HttpServletResponse response) throws IOException { 
        String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);  
        if(authHeader != null && authHeader.startsWith("Bearer ")){
            try {
                String refresh_token =  authHeader.substring("Bearer ".length());
                Algorithm algorithm = Algorithm.HMAC256("secret".getBytes());
                JWTVerifier verifier = JWT.require(algorithm).build();
                DecodedJWT decodedJWT = verifier.verify(refresh_token);
                String username = decodedJWT.getSubject();
                User user = userServiceImplementation.getUser(username);
                
                String access_token = JWT.create()
                .withSubject(user.getUsername())
                .withIssuer(request.getRequestURI().toString())
                .withClaim("roles", user.getRole().stream().map(Role::getName).collect(Collectors.toList()))
                .sign(algorithm);
                
                Map <String, String> token = new HashMap<>();
                token.put("refresh", "true");
                token.put("access_token", access_token);
                token.put("refresh_token", refresh_token);
                response.setContentType("application/json");
                new ObjectMapper().writeValue(response.getOutputStream(), token);
                
            } catch (Exception e) {
                log.error("Error logging in: {}", e.getMessage());
                response.setHeader("error", e.getMessage());
                // response.sendError(HttpStatus.FORBIDDEN.value());
                response.setStatus(HttpStatus.CONFLICT.value());
                Map <String, String> error = new HashMap<>();
                error.put("error_message", e.getMessage());
                response.setContentType("application/json");
                new ObjectMapper().writeValue(response.getOutputStream(), error);
            }
        }else{
            throw new RuntimeException("Refresh Token is missing");
        }
    }
}
