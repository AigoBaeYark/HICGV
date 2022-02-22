package com.hicgv.store.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Connection.Method;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
		List<StoreDto> storeDtos = storeService.getStoreList();
		for (StoreDto storeDto : storeDtos) {
			System.out.println(storeDto.getProduct_categori());
		}
		
		// 최초의 실행
		// storeService = new StoreServiceImpl();
		// storeService.getPopcorn();
		model.addAttribute("list",storeDtos);
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
	public String insertStoreData(HttpServletRequest req, Model model, @ModelAttribute StoreDto storeDto) throws IOException {
		logger.info("before insertStoreData");
		
		HashMap<String, Object> store = new HashMap<String,Object>();
		
		System.out.println(storeDto.getProduct_price());
		System.out.println(storeDto.getProduct_name());
		System.out.println(storeDto.getProduct_categori());
		System.out.println(storeDto.getProduct_categori_name());
		System.out.println(storeDto.getProduct_name());
		System.out.println(storeDto.getProduct_img()); 
		System.out.println(storeDto.getProduct_script()); 
		
		if(storeDto.getProduct_img().equals(null) || storeDto.getProduct_img().equals("")) {
			System.out.println("이미지없음");
			storeDto.setProduct_img("이미지없음");
		}
		System.out.println(storeDto.getProduct_img()); 

		storeService.insertProduct(storeDto);


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
		logger.info("after insertStoreData");
		return "redirect:store";
	}

//	@RequestMapping(value = "insertStoreData", method = RequestMethod.POST, consumes = "multipart/form-data")
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
