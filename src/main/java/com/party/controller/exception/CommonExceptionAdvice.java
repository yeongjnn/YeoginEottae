package com.party.controller.exception;

import java.util.Arrays;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.party.controller.room.RoomController;

@ControllerAdvice // 스프링의 bean 으로 처리
public class CommonExceptionAdvice {

	private static final org.apache.logging.log4j.Logger log = org.apache.logging.log4j.LogManager
			.getLogger(CommonExceptionAdvice.class);

	// 범용적인 예외처리
	@ResponseBody
	@ExceptionHandler(Exception.class)
	public String exceptCommon(Exception exception) {

		log.error("-------------");
		log.error(exception.getMessage());

		StringBuffer buffer = new StringBuffer("<ul>");

		buffer.append("<li>" + exception.getMessage() + "</li>");

		Arrays.stream(exception.getStackTrace()).forEach(stacaTraceElement -> {
			buffer.append("<li>" + stacaTraceElement + "</li>");
		});

		buffer.append("</ul>");

		return buffer.toString();
	}
}

/*
 * 개발할 때는 예외 메시지가 자세하게 출력되는 것이 좋을 때가 많이 때문에 디버깅용으로 예외처리를 해 두고 나중에 배포할 때는 별도의 에러
 * 페이지를 만들어서 사용하는 것이 좋다. - <자바 웹 개발 워크북>
 */