/*-- * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validation;

import error.QuestionError;

/**
 *
 * @author ADMIN
 */
public class QuestionValidator extends AbstractValidtor {

    private QuestionError error;

    public QuestionValidator() {
        error = new QuestionError();
    }

    public boolean checkQuestionContent(String question) {
        String pattern = "[a-zA-Z0-9 ?]{10,200}";
        return valid(pattern, question);
    }

    public boolean checkAnswer(String answer) {
        String pattern = "[a-zA-Z0-9 ]{1,200}";
        return valid(pattern, answer);
    }

    public QuestionError checkQuestion(String question, String correctA, String answer1, String answer2, String answer3) {
        if (!checkQuestionContent(question)) {
            error.setMessage(QuestionError.QUESTION_CONTENT_FORMAT_ERROR);
        } else if (!(checkAnswer(answer1) && checkAnswer(answer2) && checkAnswer(answer3) && checkAnswer(correctA))) {
            error.setMessage(QuestionError.ANSWER_CONTENT_FORMAT_ERROR);
        } else if (answer1.toUpperCase().trim().equals(answer2.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else if (answer1.toUpperCase().trim().equals(answer3.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else if (answer1.toUpperCase().trim().equals(correctA.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else if (answer2.toUpperCase().trim().equals(correctA.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else if (answer2.toUpperCase().trim().equals(answer3.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else if (answer3.toUpperCase().trim().equals(correctA.toUpperCase().trim())) {
            error.setMessage(QuestionError.ANSWER_DUPLICATE_ERROR);
        } else {
            error.setMessage(QuestionError.VALID_SUCCESS);
        }
        return error;
    }

}
