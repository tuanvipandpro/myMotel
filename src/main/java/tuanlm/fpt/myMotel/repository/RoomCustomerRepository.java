/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tuanlm.fpt.myMotel.model.RoomCustomer;

/**
 *
 * @author Tuan
 */
@Repository
public interface RoomCustomerRepository extends JpaRepository<RoomCustomer, Integer>{
    List<RoomCustomer> findByRoomId(int room_id);
}
