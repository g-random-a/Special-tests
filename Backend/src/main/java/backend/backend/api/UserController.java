package com.mobapp.SpecialTest.api;

import java.net.URI;
import java.util.Collection;
import java.util.List;

import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.Repository.RoleRepository;
import com.mobapp.SpecialTest.models.Role;
import com.mobapp.SpecialTest.models.User;
import com.mobapp.SpecialTest.services.UserServiceImplementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class UserController {
    @Autowired
    private final UserServiceImplementation userService;
    @Autowired
    UserRepository userRepo;
    // ClientServiceImplementation clientServ;
    UserServiceImplementation userServ;
    RoleRepository roleRepo;

    @GetMapping("/user")
    public ResponseEntity<User>getUsers(Authentication auth){
        try {
            User user = userServ.getUserAuth(auth);
            return ResponseEntity.ok().body(user);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/user/edit") //to edit user information
    public ResponseEntity<User>editUsers(Authentication auth){
        return ResponseEntity.ok().build();
    }

    @GetMapping("/users")
    public ResponseEntity<List<User>>getUsers(){
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).header("headerName", "headerValues").allow(HttpMethod.GET).allow(HttpMethod.DELETE)
        .location(URI.create("location")).location(URI.create("location"))
        .body(userService.getUsers());
    }

    @PostMapping("/user/save")
    public ResponseEntity<User>saveUser(@RequestBody User user, @RequestBody String role_name){
        URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("/api/user/save").toUriString());
        Role role = roleRepo.findByName(role_name);
        Collection<Role> roles = user.getRole();
        roles.add(role);
        user.setRole(roles);
        return ResponseEntity.created(uri).body(userService.saveUser(user));
    }

    @PostMapping("/role/save")
    public ResponseEntity<Role>roleUser(@RequestBody Role role){
        URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("/api/role/save").toUriString());
        return ResponseEntity.created(uri).body(userService.saveRole(role));
    }

    @PostMapping("/role/addtouser")
    public ResponseEntity<?>addRoleToUser(@RequestBody RoleToUserForm form){
        userService.addRoleToUser(form.getUsername(), form.getRolename());
        return ResponseEntity.ok().build();
    }

}

@Data
class RoleToUserForm{
    private String username;
    private String rolename;
}
