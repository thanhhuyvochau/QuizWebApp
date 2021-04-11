/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class UserMapper implements MapperInterface<User> {
 Logger log = Logger.getLogger(UserMapper.class.getName());
    public User mapper(ResultSet result) {
        User user = null;
        try {
            String userId = result.getString("user_id");
            String userName = result.getString("user_name");
            boolean isAdmin = result.getBoolean("is_admin");
            String password = "";
            user = new User(userId, userName, password, isAdmin);
        } catch (Exception ex) {
            //log
            log.info(ex.toString());
        }
        return user;

    }

}
