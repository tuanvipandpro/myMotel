/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tuanlm.fpt.myMotel.model.Power;

/**
 *
 * @author Tuan
 */
@Repository
public interface PowerRepository extends JpaRepository<Power, Integer>{
    List<Power> findTop2ByRoomIdOrderByDateDesc(int room_id);
}
