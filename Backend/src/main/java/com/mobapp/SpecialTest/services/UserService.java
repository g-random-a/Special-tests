package com.mobapp.SpecialTest.services;

import java.util.List;

import com.mobapp.SpecialTest.models.Role;
import com.mobapp.SpecialTest.models.User;

import org.springframework.security.core.Authentication;


public interface UserService {
    User saveUser(User user);
    Role saveRole(Role role);
    void addRoleToUser(String username, String roleName);
    User getUser(String username);
    List<User>getUsers();
    User getUserAuth(Authentication auth);
}
