package com.mobapp.SpecialTest.Repository;

import com.mobapp.SpecialTest.models.User;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
