/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tuanlm.fpt.myMotel.model.Room;

/**
 *
 * @author Tuan
 */
@Repository
public interface RoomRepository extends JpaRepository<Room, Integer>{
    List<Room> findByOwner(String owner);
    Room findById(int id);
}
