/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.Account;
import tuanlm.fpt.myMotel.repository.AccountRepository;
import tuanlm.fpt.myMotel.utils.Constant;
import tuanlm.fpt.myMotel.utils.HashUtils;

/**
 *
 * @author Tuan
 */
@Service
public class AccountService {
    @Autowired
    private AccountRepository accountRepository;
    Logger logger = Constant.logger;
    
    public Account checkLogin(String username, String password){
        Account acc = accountRepository.findByUsername(username);
        if (acc != null && new HashUtils().checkString(password, acc.getPassword())) return acc;
        else return null;
    }
    
    public boolean updatePassword(String username, String newPassword){
        Account acc = accountRepository.findByUsername(username);
        try {
            acc.setPassword(new HashUtils().getHashString(newPassword));
            accountRepository.save(acc);
            return true;
        }
        catch (Exception e) {
            logger.error("AccountService - Update Password Error : " + e.getMessage());
            return false;
        }
    }
}
