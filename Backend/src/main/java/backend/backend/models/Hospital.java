package com.mobapp.SpecialTest.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Data;


  
@Entity
@Table(name = "Hospital") @Data
public class Hospital{
        
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private long hosp_id;
    private String name;
    private String description;
    private Float rating;
    private int ratedClients;
    private String address;
    private int requestedTimes;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "hospital_test", joinColumns = @JoinColumn(name = "hosp_id"),  inverseJoinColumns = @JoinColumn(name = "test_id"))
    private List<SpecialTest> specialTest;

    @OneToMany(fetch = FetchType.LAZY)
    @JsonProperty(access = Access.WRITE_ONLY)
    private List<Request> request;
    
    // @OneToOne(cascade = CascadeType.ALL)
    // @JoinColumn(name = "hosp_id", referencedColumnName = "user_id")
    @OneToOne
    private User user;

    // @JsonProperty(access = Access.WRITE_ONLY)
    // public Long getClient_id(){
    //     return this.hosp_id;
    // }
    
}
    



