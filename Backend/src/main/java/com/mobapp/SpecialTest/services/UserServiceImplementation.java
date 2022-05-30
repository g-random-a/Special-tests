package com.mobapp.SpecialTest.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.mobapp.SpecialTest.Repository.RoleRepository;
import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.models.Role;
import com.mobapp.SpecialTest.models.User;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;


@Service
@RequiredArgsConstructor @Transactional @Slf4j
public class UserServiceImplementation implements UserService, UserDetailsService{

    @Autowired
    private final UserRepository userRepo;
    private final RoleRepository roleRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public User saveUser(User user) {
        log.info("saving new user {} to the database...", user);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepo.save(user);
    }

    @Override
    public Role saveRole(Role role) {
        log.info("saving {} role to the database...", role);
        return roleRepo.save(role);
    }

    @Override
    public void addRoleToUser(String username, String roleName) {
        log.info("adding role {} to user {} ...", roleName, username);
        User user = userRepo.findByUsername(username);
        Role role = roleRepo.findByName(roleName);
        user.getRole().add(role);
        userRepo.save(user);
    }

    @Override
    public User getUser(String username) {
        log.info("fetching user {} from the database...", username);
        return userRepo.findByUsername(username);
    }

    @Override
    public List<User> getUsers() {
        log.info("fetching all user from the database...");
        return userRepo.findAll();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user= userRepo.findByUsername(username);
        if(user == null){
            log.error("User not found");
            throw new UsernameNotFoundException("User Not Found in the database");
        }
        else{
            log.info("User found in the database");
        }
        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        user.getRole().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        });
         return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword() , authorities);
    }

    @Override
    public User getUserAuth(Authentication auth) {
        String username = auth.getPrincipal().toString();
        log.info("fuck u _|_ _|_ " ,username);
        User user = userRepo.findByUsername(username);
        log.info("*************{}*************", user.getName());
        return user;
    }

    
}
