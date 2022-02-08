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
		System.out.println("======= << theater >> =======");
		return "/theater/theater";

	}
}