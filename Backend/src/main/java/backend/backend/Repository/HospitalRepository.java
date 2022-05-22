package com.mobapp.SpecialTest.Repository;
import java.util.List;

import com.mobapp.SpecialTest.models.Hospital;
import com.mobapp.SpecialTest.models.SpecialTest;
import com.mobapp.SpecialTest.models.User;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HospitalRepository extends JpaRepository<Hospital, Long>{
    Hospital findByUser(User user);

    List<Hospital> findBySpecialTest(SpecialTest test);

    @Query("FROM Hospital ORDER BY Requestedtimes ASC LIMIT 10")
    List<Hospital> findAllOrderByRequestedTimesDsc();
    
}



