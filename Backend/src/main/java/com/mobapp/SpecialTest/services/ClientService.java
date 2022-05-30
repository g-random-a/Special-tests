package com.mobapp.SpecialTest.services;

import java.util.List;

import com.mobapp.SpecialTest.helper.hospitalTestHeper;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.User;

import org.springframework.security.core.Authentication;



public interface ClientService {
    public Client saveClient(User user, Client client);
    Client getClient(User user);
    Client editClient(Client client);
    Request clientRequest(long hospital, long test, User user);
    List<Hospital> specialTestHospitals(long id);
    public List<hospitalTestHeper> catagoryHospitals(String catagory);
}
