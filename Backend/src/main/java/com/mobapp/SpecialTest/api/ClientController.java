package com.mobapp.SpecialTest.api;

import java.util.List;
import java.util.Optional;

import com.mobapp.SpecialTest.Repository.ClientRepository;
import com.mobapp.SpecialTest.Repository.HospitalRepository;
import com.mobapp.SpecialTest.Repository.RequestRepository;
import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.helper.ClientandUser;
import com.mobapp.SpecialTest.helper.hospitalTestHeper;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.User;
import com.mobapp.SpecialTest.services.ClientServiceImplementation;
import com.mobapp.SpecialTest.services.UserServiceImplementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api") @Slf4j
public class ClientController {

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

    ClientandUser CandU;

    @GetMapping("/client") // get client  +++++++++++++++++++++
    public ResponseEntity<Client>getClient(Authentication auth){

       try {
        User user = userServ.getUserAuth(auth);
        log.info("**************{}*************", user.getName());
        System.out.println(user);

        Client client = clientServ.getClient(user);
        return ResponseEntity.ok().body(client);
       } catch (Exception e) {
           return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
       }
    }

    @GetMapping("/client/all") // get client
    public ResponseEntity<List<Client>> getClients(Authentication auth){
        return ResponseEntity.status(HttpStatus.OK).body(clientRepo.findAll());
    }

    @PutMapping("/client/update") //edit profile ++++++++++++++++++++++
    public ResponseEntity<Client>editClient(@RequestBody  Client client, Authentication auth){
       try {
        Client cl = clientServ.editClient(client);
        return ResponseEntity.ok().body(cl);
       } catch (Exception e) {
        return ResponseEntity.status(HttpStatus.NOT_MODIFIED).build();
       }
    }

    @GetMapping("/client/hospitals/{catagory}")
    public ResponseEntity<List<hospitalTestHeper>> getHospitals(@PathVariable(value = "catagory") String catagory,Authentication auth){
        List<hospitalTestHeper> hosptestHelper = clientServ.catagoryHospitals(catagory);
        return ResponseEntity.ok().body(hosptestHelper);
    }

    @GetMapping("/client/catagoies")
    public ResponseEntity<User>catagories(@RequestParam String catagory,Authentication auth){
        return ResponseEntity.ok().build();
    }
    
    @GetMapping("/client/test/hosp")
    public ResponseEntity<List<Hospital>> specialTestHospital(@RequestParam(value = "id") long id,Authentication auth){
        List<Hospital> hosp = clientServ.specialTestHospitals(id);
        return ResponseEntity.ok().body(hosp);
    }

    @GetMapping("/client/request") // view sent requests
    public ResponseEntity<List<Request>> clientViewRequests(Authentication auth){
        User user = userServ.getUserAuth(auth);
        Client client = clientServ.getClient(user);
        return ResponseEntity.ok().body(client.getRequest());
    }

    @DeleteMapping("/client/request/{id}") //delete sent requests
    public ResponseEntity<User>clientEditRequests(@PathVariable(value = "id") Long id, Authentication auth){
        reqRepo.deleteById(id);
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/client/request") //to send requests
    public ResponseEntity<Request>clientSendRequests(@RequestBody long test,@RequestBody long hospital ,Authentication auth){
        User user = userServ.getUserAuth(auth);
        Request req = clientServ.clientRequest(hospital, test, user);
        return ResponseEntity.ok().body(req);
    }

    @PostMapping("/client/hosp/{id}") //to view hospital profile
    public ResponseEntity<Optional<Hospital>> viewHospitalProfile(@PathVariable(value = "id") Long id,Authentication auth){
        Optional<Hospital> hospital = hospRepo.findById(id);
        return ResponseEntity.ok().body(hospital);
    }

    @PostMapping("/client/rate/{id}") //to rate hosipitals
    public ResponseEntity<Hospital>rateHospital(@PathVariable(value = "id") Long id, @RequestBody float rate , Authentication auth){
        Optional<Hospital> hospital = hospRepo.findById(id);
        Hospital hos = null;
        if(hospital.isPresent()){
            hos = hospital.get();
            int ratedClients = hos.getRatedClients();
            float current_rate = (hos.getRating() * ratedClients) +rate;
            hos.setRatedClients(ratedClients +1);
            hos.setRating(current_rate/ (ratedClients +1));
            hospRepo.save(hos);
            return ResponseEntity.ok().body(hos);
        }
        return ResponseEntity.ok().body(null);
    }

}