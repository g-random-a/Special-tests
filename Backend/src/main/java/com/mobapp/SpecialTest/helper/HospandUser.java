package com.mobapp.SpecialTest.helper;

import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.User;

public class HospandUser {
    public User user;
    public Hospital hospital;

    HospandUser(User user, Hospital hosp){
        this.user = user ;
        this.hospital = hosp;
    }
}