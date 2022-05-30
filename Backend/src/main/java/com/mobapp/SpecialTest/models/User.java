package com.mobapp.SpecialTest.models;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class User{
    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private long user_id;
    private String name;
    @Column(unique=true)
    private String username;
    private String password;
    @ManyToMany(fetch = FetchType.LAZY)
    private Collection<Role> role = new ArrayList<>();
    
}
