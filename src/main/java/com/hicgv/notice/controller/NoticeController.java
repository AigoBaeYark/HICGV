package com.hicgv.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hicgv.admin.dto.AdminDto;
import com.hicgv.admin.vopage.SearchVO;
import com.hicgv.notice.dto.NoticeDto;
import com.hicgv.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	//공지사항으로 이동
	@RequestMapping("/noticeList")
	public String noticeList(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("=========pass by noticelist()=============");
		// paging
				String strPage = request.getParameter("page");
				System.out.println("strPage1 : " + strPage);
				if (strPage == null)
					strPage = "1";
				System.out.println("strPage2 : " + strPage);

				int page = Integer.parseInt(strPage);
				searchVO.setPage(page);

				// NoticeDao dao = (NoticeDao) noticeService.noticelist();

				// totcnt
				int total = noticeService.selectNoticeTotCount();
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
				ArrayList<NoticeDto> noticeList = noticeService.noticelist();
				// ArrayList<AdminDto> list=dao.list(rowStart,rowEnd);

				model.addAttribute("list", noticeList);
				model.addAttribute("totRowCnt", total);
				model.addAttribute("searchVO", searchVO);
				
		return "/notice/noticeList";
	}

}
