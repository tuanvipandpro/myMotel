/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tuanlm.fpt.myMotel.model.Details;

/**
 *
 * @author Tuan
 */
public interface DetailsRepository extends JpaRepository<Details, Integer>{
    
}
