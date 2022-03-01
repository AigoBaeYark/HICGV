package com.hicgv.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hicgv.admin.dto.AdminDto;
import com.hicgv.admin.vopage.SearchVO;
import com.hicgv.customer.dto.CustomerDto;
import com.hicgv.notice.dto.NoticeDto;
import com.hicgv.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	// 공지사항으로 이동 ㅡ,
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

	@RequestMapping("/noticeView")
	public String noticeViewmodify(HttpServletRequest request, Model model) {
		System.out.println("=========pass by noticeView()=============");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no :" + no);
		NoticeDto dto = new NoticeDto();
		dto = noticeService.noticeView(no);
		System.out.println("getid : " + dto.getNo());
		System.out.println("getid : " + dto.getTitle());
		System.out.println("getid : " + dto.getWriter());
		System.out.println("getid : " + dto.getHit());
		System.out.println("getid : " + dto.getContent());
		System.out.println("getid : " + dto.getNcreate_at());
		model.addAttribute("noticeView", dto);
		return "/notice/noticeView";

	}

	@RequestMapping("/noticeModifyForm")
	public String noticeModifyForm(HttpServletRequest request, Model model) {
		System.out.println("=========pass by noticeModifyForm()=============");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("no :" + no);
		NoticeDto dto = new NoticeDto();
		dto = noticeService.noticeView(no);
		System.out.println("getid : " + dto.getNo());
		model.addAttribute("noticeMotify", dto);
		return "/notice/noticeModifyForm";

	}

	@RequestMapping(value = "/noticeModify", method = RequestMethod.POST)
	public String noticeModify(HttpServletRequest request, Model model, @ModelAttribute NoticeDto noticeDto)
			throws Exception {
		{
			System.out.println("=========pass by noticeModify()=============");

			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println("no : " + no);

			System.out.println(noticeDto.getNo());

			noticeService.noticeModify(noticeDto);
			System.out.println("성공적으로 공지사항이 수정되었습니다.");
		}
		return "redirect:noticeList";
	}

	@RequestMapping("/noticeDelete")
	public String customerDelete(HttpServletRequest request, Model model) {
		System.out.println("=========pass by noticeDelete()=============");
		int no = Integer.parseInt(request.getParameter("no"));
		noticeService.noticeDelete(no);
		System.out.println(no + "번 글이 삭제되었습니다.");

		return "redirect:noticeList";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/noticeWriteForm")
	public String noticeWriteForm(HttpServletRequest request, Model model){
			System.out.println("=========pass by noticeWriteFrom()=============");
			String writer = request.getParameter("writer");
			model.addAttribute("write", writer);
			return "/notice/noticeWriteForm";
		}
	@RequestMapping(method = RequestMethod.POST, value = "/noticeWrite")
	public String noticeWrite(HttpServletRequest request, Model model, @ModelAttribute NoticeDto noticeDto)
			throws Exception {
		{
			System.out.println("=========pass by noticeWrite()=============");
			noticeService.noticeWrite(noticeDto);
			return "redirect:noticeList";
	}
	}
	}
