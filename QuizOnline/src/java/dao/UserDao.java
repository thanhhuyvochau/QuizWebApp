/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.Vector;
import mapper.UserMapper;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserDao extends AbstractDao<User> {

    public User authenticateUser(String userId, String password) {
        String sql = "SELECT users.user_id,users.user_name,users.is_admin\n"
                + "FROM users \n"
                + "WHERE users.user_id like ? AND password like ?";
        Vector<User> result = new Vector<User>();
        result = query(sql, new UserMapper(), userId, password);
        User user = null;
        if (!result.isEmpty()) {
            user = result.get(0);
        }
        return user;
    }

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (user_id,user_name,is_admin,password)\n"
                + "VALUES (?,?,0,?);";
        String userId = user.getEmail();
        String userName = user.getName();
        String password = user.getPassword();
        boolean registeResult = updateQuery(sql, userId, userName, password);
        return registeResult;
    }

    public User getUserById(String id) {
        String sql = "SELECT users.user_id,users.user_name,users.is_admin\n"
                + "FROM users \n"
                + "WHERE users.user_id like ?";
        Vector<User> result = new Vector<User>();
        result = query(sql, new UserMapper(),id);
        User user = null;
        if (!result.isEmpty()) {
            user = result.get(0);
        }
        return user;
    }
    

}
