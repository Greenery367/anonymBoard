package com.test.board.Handler.Exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;


@Getter
public class RedirectException extends RuntimeException {
	
	private HttpStatus status;
	
	public RedirectException(String message, HttpStatus status) {
		super(message);
		this.status = status;
	}
	
}
