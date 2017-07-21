package com.ssm.wzry.exception;

public class CustomException extends Exception {
    String message;

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public CustomException(String message) {
        super(message);
        setMessage(message);
    }
}
