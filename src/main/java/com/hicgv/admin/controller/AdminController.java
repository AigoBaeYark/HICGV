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

		// paging
		String strPage = request.getParameter("page");
		System.out.println("strPage1 : " + strPage);
		if (strPage == null)
			strPage = "1";
		System.out.println("strPage2 : " + strPage);

		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);

		// AdminDao dao = (AdminDao) adminService.customerlist();

		// totcnt
		int total = adminService.selectCustomerTotCount();
		searchVO.pageCalculate(total);

		System.out.println("Totpage : " + total);
		System.out.println("clickPage : " + strPage);
		System.out.println("pageStart : " + searchVO.getPageStart());
		System.out.println("pageEnd : " + searchVO.getPageEnd());
		System.out.println("pageTot : " + searchVO.getTotPage());
		System.out.println("rowStart : " + searchVO.getRowStart());
		System.out.println("rowEnd : " + searchVO.getRowEnd());

		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();
		ArrayList<AdminDto> list = adminService.customerlist();
		// ArrayList<AdminDto> list=dao.list(rowStart,rowEnd);

		model.addAttribute("list", list);
		model.addAttribute("totRowCnt", total);
		model.addAttribute("searchVO", searchVO);
		return "/adminCustomer/customerList";
	}

	@RequestMapping("/customerView")
	public String customerView(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerView()=============");
		String id = request.getParameter("id");
		System.out.println("id :" + id);
		AdminDto dto = new AdminDto();
		dto = adminService.customerView(id);
		System.out.println("getid : " + dto.getId());
		model.addAttribute("customerView", dto);
		return "/adminCustomer/customerView";

	}

	@RequestMapping("/customerModifyForm")
	public String customerModifyForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerModifyForm()=============");
		String id = request.getParameter("id");
		System.out.println("id :" + id);
		AdminDto dto = new AdminDto();
		dto = adminService.customerView(id);
		System.out.println("getid : " + dto.getId());
		model.addAttribute("customerMotify", dto);
		return "/adminCustomer/customerModifyForm";

	}

	@RequestMapping(value = "/customerModify", method = RequestMethod.POST)
	public String customerModify(HttpServletRequest request, Model model, @ModelAttribute AdminDto AdminDto)
			throws Exception {
		{
			System.out.println("=========pass by customerModify()=============");

			String id = request.getParameter("id");
			System.out.println("id : " + id);

			System.out.println(AdminDto.getId());
			System.out.println(AdminDto.getGender());
			System.out.println(AdminDto.getPhone_number());
			System.out.println(AdminDto.getNickname());
			System.out.println(AdminDto.getDate_birth());
			System.out.println(AdminDto.getLocation());
			System.out.println(AdminDto.getEmail());
			System.out.println(AdminDto.getQuestion());
			System.out.println(AdminDto.getAnswer());

			// AdminDto adminDto = new AdminDto();
			adminService.customerModify(AdminDto);
			System.out.println("성공적으로 회원정보가 수정되었습니다.");
		}
		return "/adminCustomer/customerList";
	}

	@RequestMapping("/customerDelete")
	public String customerDelete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by customerDelete()=============");
		String id = request.getParameter("id");

		adminService.customerDelete(id);
		System.out.println(id+"님의 회원정보가 삭제되었습니다.");
		return "/adminCustomer/customerList";
	}

}
