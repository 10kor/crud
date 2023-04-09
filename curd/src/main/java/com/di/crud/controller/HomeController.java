package com.di.crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.di.crud.dto.BoardDto;
import com.di.crud.dto.MemberDto;
import com.di.crud.dto.ReplyDto;
import com.di.crud.service.HomeService;
import com.di.crud.service.PagingPgm;


@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	/******************** Member ********************/
	/* 로그인 */
	@RequestMapping(value = "member_login.do")
	public String member_login() {
		return "Member/member_login";
	}
	
	/* 로그인 실행 */
	@RequestMapping(value = "member_login_action.do", method = RequestMethod.POST)
	public String admin_login_action(@RequestParam("mail") String mail,@RequestParam("mpw") String mpw, 
									HttpSession session, Model model) throws Exception {
		int result=0;		
		MemberDto md = service.memberLogin(mail);

		if(md == null) {
			result = 1;
			model.addAttribute("result", result);
			return "Member/member_login_result";
		}else {
			if(md.getMpw().equals(mpw)){
				System.out.println("login ok");
				session.setAttribute("md", md);
				return "redirect:board_list.do";
			}else {
				result = 2;
				model.addAttribute("result", result);
				return "Member/member_login_result";
			}
		}
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "member_logout.do")
	public String logout(HttpSession session) {
		session.invalidate();	
		return "redirect:board_list.do";
	}
	
	/* 회원 가입 */
	@RequestMapping(value = "member_sign.do")
	public String member_sign() {
		return "Member/member_sign";
	}
	
	/* Mail 중복검사 (ajax) */
	@RequestMapping(value = "member_mail.do", method = RequestMethod.POST)
	@ResponseBody
	public int member_mail(String mail, Model model) throws Exception {
		int result = service.memberMail(mail);
		model.addAttribute("result", result);
		return result;
	}
	
	/* 회원 가입 완료*/
	@RequestMapping(value = "member_sign_action.do", method = RequestMethod.POST)
	public String member_sign_action(MemberDto md, HttpServletRequest request, Model model) throws Exception {

		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		String mailid = request.getParameter("mail_id").trim();
		String maildomain = request.getParameter("mail_domain").trim();
		String mail = mailid + "@" + maildomain;
		
		md.setMail(mail);
		md.setPhone(phone);

		int result = service.memberSign(md);
		model.addAttribute("result", result);
		
		return "redirect:board_list.do";
	}
	
	/* 회원정보 보기 */
	@RequestMapping(value = "member_account.do")
	public String member_account(MemberDto md, HttpSession session, Model model) throws Exception {
		
		MemberDto get = (MemberDto) session.getAttribute("md");
		String mail = (String)get.getMail();
		MemberDto lists = service.memberLogin(mail);
		model.addAttribute("lists", lists);
		
		String phone = lists.getPhone();
		String p1 = phone.substring(0,3);
		String p2 = phone.substring(4,8);
		String p3 = phone.substring(9);
		model.addAttribute("p1", p1);
		model.addAttribute("p2", p2);
		model.addAttribute("p3", p3);
		
		return "Member/member_account";
	}
	
	/* 회원정보 수정 */
	@RequestMapping(value = "member_update.do", method = RequestMethod.POST)
	public String member_update(MemberDto md, HttpServletRequest request, Model model) throws Exception {

		String phone1 = request.getParameter("phone1").trim();
		String phone2 = request.getParameter("phone2").trim();
		String phone3 = request.getParameter("phone3").trim();
		String phone = phone1 + "-" + phone2 + "-" + phone3;
		md.setPhone(phone);

		System.out.println(md.getMno());
		System.out.println(md.getGender());
		System.out.println(md.getLocation());
		System.out.println(md.getPhone());
		
		int result = service.memberUpdate(md);
		model.addAttribute("result", result);
		MemberDto lists = service.memberLogin(md.getMail());
		model.addAttribute("lists", lists);
		
		return "Member/member_update";
	}
	
	/* 회원 탈퇴 */
	@RequestMapping(value = "member_delete.do", method = RequestMethod.GET)
	public String member_delete(@RequestParam int mno, HttpServletRequest request, Model model) throws Exception {


		System.out.println("mno : "+mno);
		int result = service.memberDelete(mno);
		model.addAttribute("result", result);
		
		return "Member/member_delete";
	}
	
	/******************** Board ********************/
	/* 게시판 리스트 */
	@RequestMapping(value = "board_list.do")
	public String board_list(String pageNum, BoardDto BoardDto, 
							HttpSession session, Model model) throws Exception {
		
		final int rowPerPage = 10;						// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);	// 현재페이지
		
		int total = service.getBoardTotal(BoardDto); // 검색
		System.out.println("total:"+total);
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		BoardDto.setStartRow(startRow);
		BoardDto.setEndRow(endRow);
		
		int no = total - startRow + 1;					// 화면 출력 번호
		List<BoardDto> boardlist = service.Boardlist(BoardDto);
		
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		
		return "Board/board_list";
	}
	
	/* 게시판 내용보기*/
	@RequestMapping(value = "board_view.do")
	public String board_view(String pageNum, int bno, BoardDto BoardDto, ReplyDto ReplyDto,
									HttpSession session, Model model, HttpServletRequest request) throws Exception {
        
		MemberDto get = (MemberDto) session.getAttribute("md");
		if(get!=null) {
			int smno = (int)get.getMno();
			model.addAttribute("smno", smno);
		}
		// 조회수 +1
		service.BoardCountPlus(bno);
		
        // 내용 list
    	List<BoardDto> boardview = service.Boardview(bno);
    	model.addAttribute("boardview", boardview);
    	
    	// 댓글 list
    	List<ReplyDto> ReplyList = service.ReplyList(bno);
   
    	model.addAttribute("ReplyList", ReplyList);
    	model.addAttribute("pageNum", pageNum);
    	
    	return "Board/board_view";
    }
	
	/* 게시판 글쓰기 */
	@RequestMapping(value = "board_add.do")
	public String board_add (MemberDto md,HttpSession session, HttpServletRequest request, Model model) throws Exception {
       
		// 세션이 없으면 home
        HttpSession reset = request.getSession(false);
        if (reset == null) {
            return "Board/board_list";
        }
        
		MemberDto get = (MemberDto) session.getAttribute("md");
		int mno = (int)get.getMno();
		System.out.println(mno);
		
		model.addAttribute("mno", mno);
		return "Board/board_add";
	}	
	
	/* 게시판 글쓰기 완료 */
	@RequestMapping(value = "board_add_action.do")
	public String board_add_action (BoardDto BoardDto, HttpSession session, Model model) throws Exception {
		System.out.println(BoardDto);
		int result = 0;
		result = service.BoardAdd(BoardDto);
		model.addAttribute("result", result);
		
		return "Board/board_add_action";
	}
	
	/* 게시판 글수정 */
	@RequestMapping(value = "board_update.do")
	public String admin_notice_update (@RequestParam int bno, @RequestParam String pageNum, 
										HttpSession session, Model model, HttpServletRequest request) throws Exception {

		// 세션이 없으면 home
        HttpSession reset = request.getSession(false);
        if (reset == null) {
            return "Board/board_list";
        }
        
		MemberDto get = (MemberDto) session.getAttribute("md");
		int mno = (int)get.getMno();
		System.out.println(mno);
		BoardDto list = service.BoardUpdateSelect(bno);
		int bmno = list.getMno();
		if(mno!=bmno) {
			return "Board/board_list";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("bno", bno);
		model.addAttribute("pageNum", pageNum);
		
		return "Board/board_update";
	}
	
	/* 게시판 글수정 완료 */
	@RequestMapping(value = "board_update_action.do")
	public String admin_notice_update_action (BoardDto BoardDto, HttpSession session, Model model) throws Exception {

		System.out.println(BoardDto);
		int result = 0;
		result = service.BoardUpdate(BoardDto);
		model.addAttribute("result", result);
		
		return "Board/board_update_action";
	}
	
	/* 게시판 글삭제 */
	@RequestMapping(value = "board_delete.do")
	public String board_delete (@RequestParam int bno,@RequestParam int mno, HttpSession session, Model model) throws Exception {

		int result = 0;
		
		MemberDto get = (MemberDto) session.getAttribute("md");
		int smno = (int)get.getMno();
		if(mno==smno) {
			result = service.BoardDelete(bno);
		}
		model.addAttribute("result", result);
		
		return "Board/board_delete_action";
	}

	/******************** Reply & Re_Reply ********************/
	/* 댓글 작성 */
	@RequestMapping(value = "reply_add.do", method = RequestMethod.POST)
	public String reply_add(ReplyDto dto,@RequestParam String pageNum, HttpSession session) throws Exception {
		
		service.ReplyAdd(dto);
		
		return "redirect:/board_view.do?bno=" + dto.getBno() + "&pageNum=" + pageNum;
	}
	
	
}
