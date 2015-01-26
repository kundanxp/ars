

package com.waa.ars.repository;

import com.waa.ars.domain.Address;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//@Repository
public interface AddressRepository extends CrudRepository<Address, String>
{
    @Query("SELECT a FROM ADDRESS a")
    List<Address> getAllAddresses();
}
