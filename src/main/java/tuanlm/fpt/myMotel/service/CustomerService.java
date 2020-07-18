/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.Customer;
import tuanlm.fpt.myMotel.repository.CustomerRepository;

/**
 *
 * @author Tuan
 */
@Service
public class CustomerService {
    @Autowired
    CustomerRepository customerRepository;
    
    public Customer getCustomerById(int id) {
        return customerRepository.findById(id);
    }
    
    public Customer updateCustomer(int id, String name, Date birthdate, boolean sex, String phone, String email) {
        Customer customer = this.getCustomerById(id);
        if (customer != null) {
            customer.setName(name);
            customer.setBirthdate(birthdate);
            customer.setSex(sex);
            String phoneRecord = ("".equals(phone)) ? null : phone; 
            customer.setPhone(phoneRecord);
            String emailRecord = ("".equals(email)) ? null : email;
            customer.setEmail(emailRecord);
            return customerRepository.save(customer);
        }
        return null;
    }
}
