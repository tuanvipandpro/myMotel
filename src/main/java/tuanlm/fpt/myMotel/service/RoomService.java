/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tuanlm.fpt.myMotel.model.Customer;
import tuanlm.fpt.myMotel.model.Room;
import tuanlm.fpt.myMotel.model.RoomCustomer;
import tuanlm.fpt.myMotel.repository.CustomerRepository;
import tuanlm.fpt.myMotel.repository.RoomCustomerRepository;
import tuanlm.fpt.myMotel.repository.RoomRepository;

/**
 *
 * @author Tuan
 */
@Service
public class RoomService {
    @Autowired
    RoomRepository roomRepository;
    @Autowired
    RoomCustomerRepository roomCustomerRepository;
    @Autowired
    CustomerRepository customerRepository;
    
    public List<Room> getRoomListByOwner (String owner) {
        return roomRepository.findByOwner(owner);
    }
    
    public Room getRoomById (int id){
        return roomRepository.findById(id);
    }   
    
    public List<Customer> getCustomerListByRoomId (int id) {
        List<Customer> list = null;
        for (RoomCustomer el : roomCustomerRepository.findByRoomId(roomRepository.findById(id).getId())) {
            if (list == null) list = new ArrayList<>();
            list.add(customerRepository.findById(el.getCustomerId()));
        }
        return list;
    }
    
    public boolean updateRoom (int id, String roomNumber, int price, int status) {
        Room room = roomRepository.findById(id);
        room.setStatus_id(status);
        room.setRoom_number(roomNumber);
        room.setPrice(price);
        return (roomRepository.save(room) != null);
    }
}
