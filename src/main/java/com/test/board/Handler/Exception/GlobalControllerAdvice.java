package com.test.board.Handler.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.board.handler.exception.DataDeliveryException;
import com.test.board.handler.exception.RedirectException;
import com.test.board.handler.exception.UnAuthorizedException;

@ControllerAdvice
public class GlobalControllerAdvice {

	@ResponseBody
	@ExceptionHandler(DataDeliveryException.class)
	public String dataDeleveryExcption(DataDeliveryException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + e.getMessage() + "')");
		sb.append("window.history.back();");
		sb.append("</script>");
		return sb.toString();
	}

	@ResponseBody
	@ExceptionHandler(UnAuthorizedException.class)
	public String unAuthorizedException(UnAuthorizedException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + e.getMessage() + "')");
		sb.append("window.history.back();");
		sb.append("</script>");
		return sb.toString();
	}

	@ExceptionHandler(RedirectException.class)
	public ModelAndView redirectException(RedirectException e) {
		ModelAndView modelAndView = new ModelAndView("errorPage");
		modelAndView.addObject("statusCode", e.getStatus().value());
		modelAndView.addObject("message", e.getMessage());
		return modelAndView;
	}

}
