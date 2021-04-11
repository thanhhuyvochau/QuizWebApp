/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.UserDao;
import java.security.MessageDigest;
import model.User;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class UserService {

    static Logger log = Logger.getLogger(UserService.class.getName());

    private UserDao userDao;

    public UserService() {
        userDao = new UserDao();
    }

    public User login(String email, String password) {
        String encryPassword = encrypPassword(password);
        User user = userDao.authenticateUser(email, encryPassword);
        return user;
    }

    public boolean register(User user) {
        String encryPassword = encrypPassword(user.getPassword());
        user.setPassword(encryPassword);
        boolean registerResult = userDao.registerUser(user);
        return registerResult;
    }

    private String encrypPassword(String password) {
        String encrypPass = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            //Add password bytes to digest
            md.update(password.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            encrypPass = sb.toString();
        } catch (Exception e) {
            log.info(e.toString());
        }
        return encrypPass;
    }

}
