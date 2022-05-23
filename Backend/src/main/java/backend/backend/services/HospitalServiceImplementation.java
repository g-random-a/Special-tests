package com.mobapp.SpecialTest.services;

import java.util.List;

import com.mobapp.SpecialTest.Repository.ClientRepository;
import com.mobapp.SpecialTest.Repository.HospitalRepository;
import com.mobapp.SpecialTest.Repository.RequestRepository;
import com.mobapp.SpecialTest.Repository.SpecialTestRepository;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.User;
import com.mobapp.SpecialTest.models.Request.Status;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service @Transactional
public class HospitalServiceImplementation implements HospitalService {

    @Autowired
    HospitalRepository hospRepo;
    @Autowired
    UserServiceImplementation userServ;
    @Autowired
    RequestRepository reqRepo;
    @Autowired
    SpecialTestRepository testRepo;
    @Autowired
    ClientRepository clientRepo;

    @Override
    public Hospital getHospital(Authentication auth) {
        User user = userServ.getUserAuth(auth);
        Hospital hosp = hospRepo.findByUser(user);
        return hosp;
    }

    @Override
    public List<Request> viewRequests(Authentication auth) {
        Hospital hosp = this.getHospital(auth);
        List<Request> req = hosp.getRequest();
        return req;
    }

    @Override
    public List<Request> approveRequest(long id,Status status ,Authentication auth) {
        Request req = reqRepo.findById(id).get();
        req.setStatus(status);
        req = reqRepo.save(req);
        Hospital hosp = this.getHospital(auth);

        return hosp.getRequest();
    }

    @Override
    public SpecialTest addSpecialTest(SpecialTest spectialTest, Authentication auth) {
        Hospital hosp = this.getHospital(auth);
        SpecialTest test = testRepo.save(spectialTest);
        List<SpecialTest> tests = hosp.getSpecialTest();
        tests.add(test);
        hosp.setSpecialTest(tests);
        hosp = hospRepo.save(hosp);

        return test;
    }

    @Override
    public SpecialTest editSpecialTest(SpecialTest spectialTest) {
        SpecialTest test = testRepo.save(spectialTest);
        return test;
    }

    @Override
    public SpecialTest editTestAvailablity(long id) {
        SpecialTest test = testRepo.findById(id).get();
        test.setAvailability(!test.getAvailability());
        testRepo.save(test);
        return test;
    }

    @Override
    public Hospital editProfile(Authentication auth, Hospital hospital) throws ResourceNotFoundException{
        Hospital hosp = getHospital(auth);
        // Hospital hosp = hospRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found on :: "+ id));
        if(hospital.getName() != null) hosp.setName(hospital.getName());
        if(hospital.getAddress() != null) hosp.setAddress(hospital.getAddress());
        if(hospital.getDescription() != null) hosp.setDescription(hospital.getDescription());

        return hospRepo.save(hosp);
    }

    @Override
    public Client viewUserProfile(long id, Authentication auth) throws ResourceNotFoundException {
        Client client = clientRepo.findById(id).orElseThrow(()-> new ResourceNotFoundException("user not found on :: "+ id));
        Hospital hosp = this.getHospital(auth);
        reqRepo.findByFromAndTo(client, hosp).orElseThrow(()-> new ResourceNotFoundException("user not found on :: "+ id));
        
        return client;
    }
    @Override
    public Hospital createHosp(Hospital hosp) throws ResourceNotFoundException {
        Hospital hospital = hospRepo.save(hosp);
        return hospital;
    }
    
    
}
