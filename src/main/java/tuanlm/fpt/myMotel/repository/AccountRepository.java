/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tuanlm.fpt.myMotel.model.Account;

/**
 *
 * @author Tuan
 */
@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
    Account findByUsername(String username);
}
