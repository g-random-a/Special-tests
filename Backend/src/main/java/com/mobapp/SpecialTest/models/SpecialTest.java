package com.mobapp.SpecialTest.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;


  
@Entity @Data @NoArgsConstructor
@AllArgsConstructor
public class SpecialTest{
        
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private long test_id;
    @Column(unique=true)
    private String name;
    private Float price;
    private String description;

    @OneToMany(fetch = FetchType.LAZY)
    @JsonProperty(access = Access.WRITE_ONLY)
    private List<Request> request;

    private String category;
    private Boolean availability;

    @ManyToMany(mappedBy = "specialTest", fetch = FetchType.EAGER, cascade = CascadeType.DETACH)
    // @JsonProperty(access = Access.WRITE_ONLY)
    private List<Hospital> hosp;

    @JsonProperty(access = Access.WRITE_ONLY)
    public List<Hospital> getHosp(){
        return this.hosp;
    }

    // @JsonProperty(access = Access.WRITE_ONLY)
    // public Long getClient_id(){
    //     return this.test_id;
    // }

}
    



