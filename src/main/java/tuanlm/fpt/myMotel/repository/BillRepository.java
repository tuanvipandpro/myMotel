/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import tuanlm.fpt.myMotel.model.Bill;

/**
 *
 * @author Tuan
 */
public interface BillRepository extends JpaRepository<Bill, Integer>{
    List<Bill> findAllByOwnerAndStatusIdOrderByDateDesc (String owner, int statusId, Pageable pageable);
    Bill findById (int id);
}
