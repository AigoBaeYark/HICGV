package com.hicgv.store.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.store.service.StoreServiceImpl;
import com.hicgv.store.service.StroreService;

@Controller
public class StoreController {
	
	@Autowired
	private SqlSession sqlSession;
	private StroreService storeService;
	
	@RequestMapping("store")
	public String viewStore() {
		System.out.println("!viewStoreController!");
		
		//최초의 실행
		storeService = new StoreServiceImpl();
		storeService.getPopcorn();
		
		return "store/store";
	}
	
}
