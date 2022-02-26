package com.hicgv.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.admin.controller.dto.AdminDto;
import com.hicgv.admin.dao.ADao;
import com.hicgv.admin.service.AdminContentViewService;
import com.hicgv.admin.service.AdminDeleteService;
import com.hicgv.admin.service.AdminModifyService;
import com.hicgv.admin.service.AdminServiceInf;
import com.hicgv.admin.service.AdminWriteService;
import com.hicgv.admin.vopage.SearchVO;

@Controller
public class AdminController {
//	@Autowired
//	AdminServiceInf commandInf;
	
	/*@Autowired
	private SqlSession sqlSession;*/
	/*	
	@RequestMapping("/getcustomerList")
	public String list(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=========pass by getcustomerList()=============");

		
//		paging
	String strPage=request.getParameter("page");
		System.out.println("strPage1 : "+strPage);
		if(strPage==null)
			strPage="1";
		System.out.println("strPage2 : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		
		ADao dao=sqlSession.getMapper(ADao.class);
//		totcnt
		int total=dao.selectBoardTotCount();
		searchVO.pageCalculate(total);
		
		
		System.out.println("Totpage : "+total);
		System.out.println("clickPage : "+strPage);
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("pageTot : "+searchVO.getTotPage());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<AdminDto> list=dao.list(rowStart,rowEnd);
		
		model.addAttribute("list",list);
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);
		return "/customer/customerList";
	}*/
/*
	@RequestMapping("/write_view")
	public String write_view() {
		System.out.println("=========pass by write_view()=============");
		
		return "write_view";
	}*/
//	@RequestMapping("/write")
//	public String write(HttpServletRequest request, Model model) {
//		System.out.println("=========pass by write()=============");
//		//db에 글쓰기진행
//		String bName=request.getParameter("bName");
//		String bTitle=request.getParameter("bTitle");
//		String bContent=request.getParameter("bContent");
//		
////		mybatis작업
//		ADao dao=sqlSession.getMapper(ADao.class);
//		dao.write(bName, bTitle, bContent);
//		
//		return "redirect:list";
////	}
//	@RequestMapping("/content_view")
//	public String content_view(HttpServletRequest request, Model model) {
//		System.out.println("=========pass by content_view()=============");
//		
//		String bid=request.getParameter("bid");
////		mybatis작업
//		ADao dao=sqlSession.getMapper(ADao.class);
//		dao.upHit(bid);//upHit처리
//		
//		AdminDto dto=dao.contentView(bid);
//		model.addAttribute("content_view",dto);
//		return "content_view";
//	}
		
//	@RequestMapping("/content_update")
//	public String content_update(HttpServletRequest request, Model model) {
//		System.out.println("=========pass by content_updateform()=============");
//		
//		String bid=request.getParameter("bid");
//		ADao dao=sqlSession.getMapper(ADao.class);
//		
//		AdminDto dto=dao.contentView(bid);
//		model.addAttribute("content_view",dto);
//		
//		return "content_update";
//	}
	/*@RequestMapping(method=RequestMethod.POST,value="/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("=========pass by modify()=============");
		
		String bid=request.getParameter("bid");
		String bName=request.getParameter("bName");
		String bTitle=request.getParameter("bTitle");
		String bContent=request.getParameter("bContent");
		
		ADao dao=sqlSession.getMapper(ADao.class);
		dao.modify(bid, bName, bTitle, bContent);
		
		return "redirect:list";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by delete()=============");
//		model.addAttribute("request",request);
//		commandInf=new BDeleteService();
//		commandInf.execute(model);
		
		String bid=request.getParameter("bid");
		ADao dao=sqlSession.getMapper(ADao.class);
		
		return "redirect:list";
	}*/
}
