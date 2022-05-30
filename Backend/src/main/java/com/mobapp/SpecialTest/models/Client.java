package com.mobapp.SpecialTest.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


  
@Entity
@Data
@Table(name = "Client") @AllArgsConstructor @NoArgsConstructor
public class Client{
        
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private long client_id;
    @OneToOne
    private User user;
    private String fristName;
    private String LastName;
    private String name;
    private Integer age;
    private Gender gender;
    public static enum Gender {
      Female, Male
    }
    private String medicalInfo; 

    @OneToMany(fetch = FetchType.LAZY)
    @JsonProperty(access = Access.WRITE_ONLY)
    private List<Request> request;

    // @JsonProperty(access = Access.WRITE_ONLY)
    // public Long getClient_id(){
    //     return this.client_id;
    // }
}
    



