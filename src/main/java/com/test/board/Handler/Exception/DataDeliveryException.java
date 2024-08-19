package com.test.board.Handler.Exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class DataDeliveryException extends RuntimeException {
	
	private HttpStatus status;
	
	public DataDeliveryException(String message, HttpStatus status) {
		super(message);
		this.status = status;
	}

}
