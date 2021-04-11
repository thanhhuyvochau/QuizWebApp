/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package error;

/**
 *
 * @author ADMIN
 */
public class UserError {
    final public static String VALID_SUCCESS = "Passed";
    final public static String LOGIN_SUCCESS = "Login Successful";
    final public static String USER_ID_FORMAT_ERROR = "Email Not Correct The Format";
    final public static String PASSWORD_FORMAT_ERROR = "Password Not Correct The Format:(a-z)(0-9) From 5-20 Character";
    final public static String USER_NAME_FORMAT_ERROR = "User Name Not Empty Or Not Contains Special Character(1-50)";
    final public static String REPEAT_PASSWORD_ERROR = "Repeate Not Correct The Password Field";
    final public static String USER_ID_DUPLICATE = "Email was existed, try another!";
    final public static String LOGIN_FAIL = "Might be user id or password incorect";
    private String message;

    public UserError() {
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
