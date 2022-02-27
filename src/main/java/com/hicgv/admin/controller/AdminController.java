package com.hicgv.admin.controller;

import java.util.ArrayList;

//import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hicgv.admin.dao.AdminDao;
import com.hicgv.admin.dto.AdminDto;
import com.hicgv.admin.service.AdminService;
import com.hicgv.admin.vopage.PageVO;
import com.hicgv.admin.vopage.SearchVO;
import com.hicgv.customer.dto.CustomerDto;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;

	
	@RequestMapping("/getcustomerList")
	public String customerlist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=========pass by getcustomerList()=============");

		
		//paging
		String strPage=request.getParameter("page");
		System.out.println("strPage1 : "+strPage);
		if(strPage==null)
			strPage="1";
		System.out.println("strPage2 : "+strPage);
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		//AdminDao dao = (AdminDao) adminService.customerlist();

	//totcnt
		int total=adminService.selectCustomerTotCount();
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
		ArrayList<AdminDto> list=adminService.customerlist();
		//ArrayList<AdminDto> list=dao.list(rowStart,rowEnd);
		
		model.addAttribute("list",list);
		model.addAttribute("totRowCnt",total);
		model.addAttribute("searchVO",searchVO);
		return "/customer/customerList";
	}

	@RequestMapping("/customerView")
	public String customerView(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerView()=============");
		String id=request.getParameter("id");
		System.out.println("id :"+ id);
		AdminDto dto = new AdminDto();
		dto = adminService.customerView(id);
		System.out.println("getid : "+dto.getId());
		model.addAttribute("customerView",dto);
		return "/adminCustomer/customerView";
		
	} 
	@RequestMapping("/customerModifyForm")
		public String customerModifyForm(HttpServletRequest request, Model model) {
			System.out.println("=========pass by customerModifyForm()=============");
			String id=request.getParameter("id");
			System.out.println("id :"+ id);
			AdminDto dto = new AdminDto();
			dto = adminService.customerView(id);
			System.out.println("getid : "+dto.getId());
			model.addAttribute("customerMotify", dto);
			return "/adminCustomer/customerModifyForm";
		
	}
	@RequestMapping(value = "/customerModify", method = RequestMethod.POST)
	public String customerModify(HttpServletRequest request, Model model, @ModelAttribute CustomerDto customerDto)
			throws Exception {
		{
			System.out.println("=========pass by customerModify()=============");

			customerDto.setId("id");

			System.out.println(customerDto.getId());
			System.out.println(customerDto.getGender());
			System.out.println(customerDto.getPhone_number());
			System.out.println(customerDto.getNickname());
			System.out.println(customerDto.getDate_birth());
			System.out.println(customerDto.getLocation());
			System.out.println(customerDto.getEmail());
			System.out.println(customerDto.getQuestion());
			System.out.println(customerDto.getAnswer());

			adminService.customerModify();

			return "/customer/myCGV";
		}
		}
	/*@RequestMapping("/customerJoin")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("=========pass by write()=============");
		//db에 글쓰기진행
		String bName=request.getParameter("bName");
		String bTitle=request.getParameter("bTitle");
		String bContent=request.getParameter("bContent");
		
		//mybatis작업
		ADao dao=sqlSession.getMapper(ADao.class);
		dao.write(bName, bTitle, bContent);
		
		return "redirect:list";
	}
	@RequestMapping("/customerView")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerView()=============");
		
		String bid=request.getParameter("bid");
//		mybatis작업
		ADao dao=sqlSession.getMapper(ADao.class);
		dao.upHit(bid);//upHit처리
		
		AdminDto dto=dao.contentView(bid);
		model.addAttribute("content_view",dto);
		return "content_view";
	}
		
	@RequestMapping("/customerUpdate")
	public String content_update(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerUpdate()=============");
		
		String bid=request.getParameter("bid");
		ADao dao=sqlSession.getMapper(ADao.class);
		
		AdminDto dto=dao.contentView(bid);
		model.addAttribute("content_view",dto);
		
		return "content_update";
	}
	@RequestMapping(method=RequestMethod.POST,value="/customerModify")
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
	@RequestMapping("/customerDelete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by delete()=============");
		model.addAttribute("request",request);
	//	commandInf=new BDeleteService();
		commandInf.execute(model);
		
		String bid=request.getParameter("bid");
		ADao dao=sqlSession.getMapper(ADao.class);
		
		return "redirect:list";
	}*/
}
