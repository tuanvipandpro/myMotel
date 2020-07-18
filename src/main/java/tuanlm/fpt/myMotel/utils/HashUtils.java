/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanlm.fpt.myMotel.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.xml.bind.DatatypeConverter;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Tuan
 */
public class HashUtils {
    // BCrypt
    public String getHashString(String string) {
        return BCrypt.hashpw(string, BCrypt.gensalt(10));
    }

    public boolean checkString(String string, String hash) {
        return BCrypt.checkpw(string, hash);
    }

    // SHA-512
    public static String encode_SHA256(String data) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(data.getBytes("UTF-8"));
        String result = DatatypeConverter.printHexBinary(hash);
        return result;
    }
    
    public static void main(String[] args) {
        System.out.println("Hash Pass (1) : " + new HashUtils().getHashString("123456"));
    }
}
