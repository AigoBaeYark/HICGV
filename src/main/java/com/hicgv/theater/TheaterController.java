package com.hicgv.theater;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.main.controller.MainController;

@Controller
public class TheaterController {

	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);

	@RequestMapping("/theater")
	public String theater() {
		System.out.println("theater");
		return "theater";

	}

	@RequestMapping("/theater2")
	public String theater2() {
		System.out.println("theater2");
		return "theater2";
	}
	
	@RequestMapping("/theater3")
	public String theater3() {
		System.out.println("theater3");
		return "theater3";
	}
}