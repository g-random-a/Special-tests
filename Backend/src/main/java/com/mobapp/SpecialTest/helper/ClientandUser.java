package com.mobapp.SpecialTest.helper;

import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.User;

public class ClientandUser {
    public User user;
    public Client client;

    ClientandUser(User user, Client client){
        this.user = user;
        this.client = client;
    }
}