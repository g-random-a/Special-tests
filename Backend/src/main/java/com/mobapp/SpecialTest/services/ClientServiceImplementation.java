package com.mobapp.SpecialTest.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mobapp.SpecialTest.Repository.ClientRepository;
import com.mobapp.SpecialTest.Repository.HospitalRepository;
import com.mobapp.SpecialTest.Repository.RequestRepository;
import com.mobapp.SpecialTest.Repository.SpecialTestRepository;
import com.mobapp.SpecialTest.Repository.UserRepository;
import com.mobapp.SpecialTest.helper.hospitalTestHeper;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.User;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service @Transactional
public class ClientServiceImplementation implements ClientService{

    @Autowired
    UserRepository userRepo;
    @Autowired
    ClientRepository clientRepo;
    @Autowired
    SpecialTestRepository testRepo;
    @Autowired
    HospitalRepository hospRepo;
    @Autowired
    RequestRepository reqRepo;
    @Autowired
    UserServiceImplementation userServ;
    // @Autowired
    // Authentication auth2;

    @Override
    public Client getClient(User user) throws ResourceNotFoundException{
        Client client = clientRepo.findByUser(user);
        if (client == null) {
            String message = "can not find a client with userName ".concat(user.getUsername());
            throw new ResourceNotFoundException(message);
        }
        return client;
    }

    @Override
    public Client editClient(Client client){
        User user = client.getUser();
        userRepo.save(user);
        clientRepo.save(client);
        return client;
    }

    // @Override
    // public Client saveClient(Client client) throws ResourceNotFoundException{
    //     User user = client.getUser();
    //     userRepo.save(user);
    //     clientRepo.save(client);
    //     return client;
    // }

   
    @Override
    public Request clientRequest(long hospital, long test, User user) throws ResourceNotFoundException{
        Hospital hosp = hospRepo.getById(hospital);
        if (hosp == null) {
            String message = "can not find specified request ";
            throw new ResourceNotFoundException(message);
        }
        SpecialTest sTest = testRepo.getById(test);
        if (sTest == null) {
            String message = "can not find specified test";
            throw new ResourceNotFoundException(message);
        }
        Client client = clientRepo.findByUser(user);
        if (client == null) {
            String message = "can not find specified client";
            throw new ResourceNotFoundException(message);
        }
        Request req = new Request(0, client, hosp, sTest, new Date() , Request.Status.Waiting);
        reqRepo.save(req);
        return req;
    }

    @Override
    public Client saveClient(User user, Client client) {
    
        client.setUser(user);
        client.setRequest(null);
        Client cl = clientRepo.save(client);
        return cl;
    }

    @Override
    public List<Hospital> specialTestHospitals(long id) throws ResourceNotFoundException{
        SpecialTest test = testRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("specified special test can not found"));
        List<Hospital> hosp = test.getHosp();

        return hosp;
    }
    @Override
    public List<hospitalTestHeper> catagoryHospitals(String catagory){
        // List<SpecialTest> test = testRepo.findByCategory(catagory);
        List<Hospital> hospitals = hospRepo.findAll();
        List<hospitalTestHeper> hospitalsCatag = new ArrayList<hospitalTestHeper>();
        for (Hospital hosp : hospitals){
            for(SpecialTest test : hosp.getSpecialTest()){
                if (test.getCategory().equals(catagory)){
                    hospitalsCatag.add(new hospitalTestHeper(hosp, test));
                }
            }
        }
        return hospitalsCatag;
    }
    
}
