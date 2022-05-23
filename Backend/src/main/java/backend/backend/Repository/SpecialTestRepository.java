package com.mobapp.SpecialTest.Repository;

import java.util.List;

import com.mobapp.SpecialTest.models.SpecialTest;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SpecialTestRepository extends JpaRepository<SpecialTest, Long>{
    SpecialTest findByCategory(String category);
}



