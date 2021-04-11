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
public class QuestionError {
    
    final public static String VALID_SUCCESS = "Passed";
    final public static String QUESTION_CONTENT_FORMAT_ERROR = "The Question Is Number Or Alphabet Or Not Empty";
    final public static String ANSWER_CONTENT_FORMAT_ERROR = "The Answer Is Number Or Alphabet";
      final public static String ANSWER_DUPLICATE_ERROR = "The Answer Must Different";
    private String message;

    public QuestionError() {
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
