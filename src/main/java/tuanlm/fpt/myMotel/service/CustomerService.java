/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
    
    public Customer updateCustomer(int id, String name, String birthdate, boolean sex, String phone, String email) throws ParseException {
        Customer customer = this.getCustomerById(id);
        if (customer != null) {
            customer.setName(name);
            customer.setBirthdate(new SimpleDateFormat("yyyy-MM-dd").parse(birthdate));
            customer.setSex(sex);
            String phoneRecord = ("".equals(phone)) ? null : phone; 
            customer.setPhone(phoneRecord);
            String emailRecord = ("".equals(email)) ? null : email;
            customer.setEmail(emailRecord);

            if (customerRepository.save(customer) != null) return customerRepository.findById(id);
        }
        return null;
    }
    
    public Customer addCustomer (String name, String birthdate, boolean sex, String phone, String email) throws ParseException {
        Customer customer = new Customer(name, new SimpleDateFormat("yyyy-MM-dd").parse(birthdate), sex);
        if (!"".equals(phone)) customer.setPhone(phone);
        if (!"".equals("email")) customer.setEmail(email);
        return customerRepository.save(customer);
    }
}
