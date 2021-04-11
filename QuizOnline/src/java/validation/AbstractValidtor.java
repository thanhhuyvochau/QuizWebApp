/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

/**
 *
 * @author ADMIN
 */
public abstract class AbstractValidtor {
    public boolean valid(String pattern, String data) {
        boolean result = false;
        result = data.matches(pattern);
        return result;
    }
}
