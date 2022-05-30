package com.mobapp.SpecialTest.Repository;
import com.mobapp.SpecialTest.models.Client;
import com.mobapp.SpecialTest.models.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long>{
    Client findByUser(User user);
    @Query(
        nativeQuery = true,
        value = "select * from client where user_user_id =:id"
    )
    Client getClient(@Param("id") long id);
}



