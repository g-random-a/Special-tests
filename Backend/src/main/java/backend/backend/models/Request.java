package com.mobapp.SpecialTest.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import lombok.AllArgsConstructor;
import lombok.Data;


  
@Entity
@Table(name = "Request")
@Data
@AllArgsConstructor
public class Request{
        
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private long req_id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Client from;

    @ManyToOne(fetch = FetchType.LAZY)
    private Hospital to;

    @ManyToOne(fetch = FetchType.LAZY)
    private SpecialTest test;

    private Date date = new Date();
    private Status status = Status.Waiting;
    public static enum Status {
        Approved, Waiting, Declined
    }

    // @JsonProperty(access = Access.WRITE_ONLY)
    // public Long getClient_id(){
    //     return this.req_id;
    // }
    
}
    



