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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.main.controller.MainController;
import com.hicgv.store.dto.StoreDto;
import com.hicgv.store.service.StoreServiceImpl;
import com.hicgv.store.service.StroreService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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

	@RequestMapping(value = "insertStoreData", method = RequestMethod.POST)
	public String insertStoreData(HttpServletRequest request, Model model, @ModelAttribute StoreDto storeDto) throws IOException {
		logger.info("before insertStoreData");
		System.out.println(storeDto.getProduct_price());
		System.out.println(storeDto.getProduct_name());

		String name = request.getParameter("product_name");
		System.out.println(name);

		// upload
//		String attachPath = "resources\\img\\store\\";
//		String uploadPath = request.getSession().getServletContext().getRealPath("/");
//		System.out.println("uploadPath : " + uploadPath);
//		String path = uploadPath + attachPath;
//		System.out.println("upload Path : " + path);
//		MultipartRequest req = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
//				new DefaultFileRenamePolicy());
//
//		String product_name = req.getParameter("name");
//		int product_categori = Integer.parseInt(req.getParameter("categoriVal"));
//		String product_categori_name = req.getParameter("categoriName");
//		int product_price = Integer.parseInt(req.getParameter("price"));
//		String product_script = req.getParameter("script");
//		String product_img = req.getFilesystemName("img");
//
//		System.out.println(product_name);
//		System.out.println(product_categori);
//		System.out.println(product_categori_name);
//		System.out.println(product_price);
//		System.out.println(product_script);
//		System.out.println(product_img);
//		// storeService.insertProduct(product_name, product_categori,
//		// product_categori_name, product_price, product_script, product_img);
//
//		logger.info("after insertStoreData");
		return "redirect:store";
	}

//	@RequestMapping(value = "insertStoreData", method = RequestMethod.POST)
//	public String name(@ModelAttribute StoreDto vo, BindingResult errors) throws Exception {
//		if (errors.hasErrors()) {
//			System.out.println(":::::::::::::::::: 에러확인 시작 :::::::::::::::::");
//			System.out.println(errors.getFieldError());
//			System.out.println(":::::::::::::::::: 에러확인 끝 :::::::::::::::::");
//		}
//		
//		return "redirect:store";
//	}

}
