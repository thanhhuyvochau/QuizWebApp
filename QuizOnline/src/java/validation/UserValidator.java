/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

import dao.UserDao;
import error.UserError;
import model.User;

/**
 *
 * @author ADMIN
 */
public class UserValidator extends AbstractValidtor {

    UserError error;

    public UserValidator() {
        error = new UserError();
    }

    public boolean validUserId(String userId) {
        boolean result = false;
        String pattern = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$";
        result = valid(pattern, userId);
        if (result == true) {
            result = userId.length() <= 30;
        }
        return result;
    }

    public boolean validUserName(String userName) {
        String pattern = "[a-zA-Z ]{1,30}";
        return valid(pattern, userName);
    }

    public boolean validPassword(String password) {
        String pattern = "[a-zA-Z0-9]{5,20}";
        return valid(pattern, password);
    }

    public boolean validRepeatePassWord(String password, String repeatPassWord) {
        boolean result = false;
        if (password.equals(repeatPassWord)) {
            result = true;
        }
        return result;
    }

    public boolean checkExisted(String userId) {
        UserDao userDao = new UserDao();
        boolean existed = false;//false la khong ton tai
        User user = userDao.getUserById(userId);
        if (user != null) {
            existed = true;
        }
        return existed;
    }

    public UserError checkUserForLogin(String userId, String password) {
        if (!validUserId(userId)) {
            error.setMessage(UserError.USER_ID_FORMAT_ERROR);
        } else if (!validPassword(password)) {
            error.setMessage(UserError.PASSWORD_FORMAT_ERROR);
        } else {
            error.setMessage(UserError.VALID_SUCCESS);
        }
        return error;
    }

    public UserError checkUserForSignUp(String userId, String userName, String password, String repeat) {
        if (!validUserId(userId)) {
            error.setMessage(UserError.USER_ID_FORMAT_ERROR);
        } else if (!validUserName(userName)) {
            error.setMessage(UserError.USER_NAME_FORMAT_ERROR);
        } else if (!validPassword(password)) {
            error.setMessage(UserError.PASSWORD_FORMAT_ERROR);
        } else if (!validRepeatePassWord(password, repeat)) {
            error.setMessage(UserError.REPEAT_PASSWORD_ERROR);
        } else if (checkExisted(userId)) {
            error.setMessage(UserError.USER_ID_DUPLICATE);
        } else {
            error.setMessage(UserError.VALID_SUCCESS);
        }
        return error;
    }

   
}
