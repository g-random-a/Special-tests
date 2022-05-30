package com.mobapp.SpecialTest.Repository;
import java.util.Optional;

import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.Request;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long>{
    Optional<Request> findByFromAndTo(Client from , Hospital to );
}



