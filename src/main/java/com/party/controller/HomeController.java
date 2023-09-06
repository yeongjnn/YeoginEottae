package com.party.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/start.do", method = RequestMethod.GET)
	public String start() {
		return "main";
	}
	
	@RequestMapping(value = "/index_mngr.do", method = RequestMethod.GET)
	public String index_mngr() {
		return "index_mngr";
	}
	
	
	
	@RequestMapping(value = "/aboutCompany.do", method = RequestMethod.GET)
	public String aboutCompany() {
		return "aboutCompany";
	}
	
	
	@RequestMapping(value = "/wayToCome.do", method = RequestMethod.GET)
	public String wayToCome() {
		return "wayToCome";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
