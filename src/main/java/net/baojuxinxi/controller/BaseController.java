package net.baojuxinxi.controller;

import java.sql.Timestamp;

import net.baojuxinxi.utils.TimestampEditer;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;


public class BaseController implements WebBindingInitializer {

	@Override
	@InitBinder
	public void initBinder(WebDataBinder arg0, WebRequest arg1) {
		arg0.registerCustomEditor(Timestamp.class, new TimestampEditer());

	}
	
}
