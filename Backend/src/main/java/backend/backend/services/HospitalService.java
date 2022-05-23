package com.mobapp.SpecialTest.services;

import java.util.List;

import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.Request.Status;

import org.springframework.security.core.Authentication;

public interface HospitalService {
    public Hospital getHospital(Authentication auth);
    List<Request> viewRequests(Authentication auth);
    List<Request> approveRequest(long id,Status status ,Authentication auth);
    SpecialTest addSpecialTest(SpecialTest spectialTest ,Authentication auth);
    public SpecialTest editSpecialTest(SpecialTest spectialTest);
    SpecialTest editTestAvailablity(long id);
    Hospital editProfile(Authentication auth, Hospital hosp);
    Client viewUserProfile(long id, Authentication auth);
    Hospital createHosp(Hospital hosp);
    
}
