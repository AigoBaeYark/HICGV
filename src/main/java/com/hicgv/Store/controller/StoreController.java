package com.hicgv.store.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection.Method;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.main.controller.MainController;
import com.hicgv.store.service.StoreServiceImpl;
import com.hicgv.store.service.StroreService;

@Controller
public class StoreController {

	@Autowired
	private StroreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);


	@RequestMapping("store")
	public String viewStore(Model model) {
		logger.info("berfore viewStore");

		// 최초의 실행
		// storeService = new StoreServiceImpl();
		// storeService.getPopcorn();
		
		logger.info("after viewStore");
		return "store/store";
	}
	
	@RequestMapping("storeAdmin")
	public String storeAdmin() {
		logger.info("before storeAdmin");
		
		logger.info("after storeAdmin");
		return "store/storeAdmin";
	}

	@RequestMapping(method = RequestMethod.POST, value = "insertStoreData")
	public String insertStoreData(HttpServletRequest request, Model model) throws IOException {
		logger.info("before insertStoreData");

		String product_name = request.getParameter("name");
		int product_categori = Integer.parseInt(request.getParameter("categoriVal"));
		String product_categori_name = request.getParameter("categoriName");
		int product_price = Integer.parseInt(request.getParameter("price"));
		String product_script = request.getParameter("script");
		String product_img = request.getParameter("img");
		

		System.out.println(product_name);
		System.out.println(product_categori);
		System.out.println(product_categori_name);
		System.out.println(product_price);
		System.out.println(product_script);
		System.out.println(product_img);
		storeService.insertProduct(product_name, product_categori, product_categori_name, product_price, product_script, product_img);
		

		logger.info("after insertStoreData");
		return "redirect:store";
	}

}
