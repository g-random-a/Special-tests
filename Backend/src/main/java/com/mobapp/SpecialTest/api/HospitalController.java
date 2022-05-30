package com.mobapp.SpecialTest.api;

import java.util.List;

import com.mobapp.SpecialTest.Repository.HospitalRepository;
import com.mobapp.SpecialTest.Repository.RequestRepository;
import com.mobapp.SpecialTest.Repository.SpecialTestRepository;
import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.Request.Status;
import com.mobapp.SpecialTest.services.HospitalServiceImplementation;
import com.mobapp.SpecialTest.services.UserServiceImplementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

//import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api") //@Slf4j
public class HospitalController {

    @Autowired
    UserRepository userRepo;
    @Autowired
    UserServiceImplementation userServ;
    @Autowired
    HospitalServiceImplementation hospServ;
    @Autowired
    HospitalRepository hospitalRepository;
    @Autowired
    SpecialTestRepository testRepo;


    @GetMapping("/hospital")
    public ResponseEntity<Hospital>getHospital(Authentication auth){
        try {
            Hospital hosp = hospServ.getHospital(auth);
            return ResponseEntity.ok().body(hosp);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/hospitals")
    public ResponseEntity<List<Hospital>>getAllHospitals(Authentication auth){
        try {
            List<Hospital> hosp = hospitalRepository.findAll();
            return ResponseEntity.ok().body(hosp);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/hospitals/popular")
    public ResponseEntity<List<Hospital>>getPopularHospitals(Authentication auth){
        try {
            List<Hospital> hosp = hospitalRepository.findAllOrderByRequestedTimesDsc();

            return ResponseEntity.ok().body(hosp);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @GetMapping("/hospital/request") // can view request
    public ResponseEntity<List<Request>>hospitalViewRequests(Authentication auth){
        try {
            List<Request> req = hospServ.viewRequests(auth);
            return ResponseEntity.ok().body(req);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping("/hospital/request/{id}") //aprove
    public ResponseEntity<List<Request>>ApproveRequests(@RequestParam long id, @RequestBody Status value,Authentication auth){
        try {
            List<Request> req = hospServ.viewRequests(auth);
            return ResponseEntity.ok().body(req);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PostMapping("/hospital/addTest") // to add Special test
    public ResponseEntity<SpecialTest>addSpecialTest(@RequestBody SpecialTest specialTest, Authentication auth){
        try {
            SpecialTest test = hospServ.addSpecialTest(specialTest, auth);
            return ResponseEntity.ok().body(test);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PutMapping("/hospital/editTest") // to edit Special test
    public ResponseEntity<SpecialTest>editSpecialTest(@RequestBody SpecialTest specialTest, Authentication auth){
        try {
            SpecialTest test = hospServ.editSpecialTest(specialTest);
            return ResponseEntity.ok().body(test);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }


    @GetMapping("/hospital/tests") // fetch all Special test
    public ResponseEntity<List<SpecialTest>>allSpecialTest(@RequestBody SpecialTest specialTest, Authentication auth){
        try {
            List<SpecialTest> test = testRepo.findAll();
            return ResponseEntity.ok().body(test);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/hospital/tests") // delete special tests
    public ResponseEntity<Boolean>deleteSpecialTest(long id, Authentication auth){
        try {
            testRepo.deleteById(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    // @PutMapping("/hospital/editTest/{id}") // to edit Special test availablity
    // public ResponseEntity<SpecialTest>editTestAvailablity(@PathVariable(value = "id") Long id){
    //     try {
    //         SpecialTest test = hospServ.editTestAvailablity(id);
    //         return ResponseEntity.ok().body(test);
    //     } catch (Exception e) {
    //         return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    //     }
    // }

    @PatchMapping("/hospital/edit") // to edit hospital profile
    public ResponseEntity<Hospital>editHospitlaProfile(@RequestBody Hospital hospital, Authentication auth) throws ResourceNotFoundException{
        Hospital hosp = hospServ.editProfile(auth, hospital);
        return ResponseEntity.ok().body(hosp);
    }

    @PutMapping("/hospital/user/{id}") // to view user profile
    public ResponseEntity<Client>viewUserProfile(@PathVariable(value = "id") long id ,Authentication auth)throws ResourceNotFoundException{
        Client client = hospServ.viewUserProfile(id, auth);
        return ResponseEntity.ok().body(client);
    }

}
 