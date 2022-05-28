package com.mobapp.SpecialTest.api;

import com.mobapp.SpecialTest.Repository.ClientRepository;
import com.mobapp.SpecialTest.Repository.HospitalRepository;
import com.mobapp.SpecialTest.Repository.RequestRepository;
import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.helper.ClientandUser;
import com.mobapp.SpecialTest.helper.HospandUser;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.User;
import com.mobapp.SpecialTest.services.ClientServiceImplementation;
import com.mobapp.SpecialTest.services.HospitalService;
import com.mobapp.SpecialTest.services.UserServiceImplementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api")
public class AuthController {

    @Autowired
    UserRepository userRepo;
    @Autowired
    ClientServiceImplementation clientServ;
    @Autowired
    ClientRepository clientRepo;
    @Autowired
    UserServiceImplementation userServ;
    @Autowired
    RequestRepository reqRepo;
    @Autowired
    HospitalRepository hospRepo;
    AuthenticationManager authManager;
    HospitalService hospServ;

    @PostMapping("/register/client") //to view hospital profile
    public ResponseEntity<User> RegisterClient(@RequestBody ClientandUser clientandUser){
        try{
            User user = clientandUser.user;
            Client client = clientandUser.client;
            // Optional<Hospital> hospital = hospRepo.findById(id);
            //save both client and user using their repo
            // use transactional
            userServ.saveUser(user);
            // userServ.saveUser(user);
            clientServ.saveClient(user, client);
            return ResponseEntity.ok().body(user);
        } catch(Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
    @PostMapping("/register/hospital") //to view hospital profile
    public ResponseEntity<User> RegisterClient(@RequestBody HospandUser hospandUser){
        try{
            User user = hospandUser.user;
            Hospital hospital = hospandUser.hospital;
            // Optional<Hospital> hospital = hospRepo.findById(id);
            //save both client and user using their repo
            // use transactional
            userServ.saveUser(user);
            hospServ.createHosp(hospital);
            return ResponseEntity.ok().body(user);
        } catch(Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    

} 