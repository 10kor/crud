package com.di.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.di.crud.dao.HomeDao;
import com.di.crud.dto.BoardDto;
import com.di.crud.dto.MemberDto;
import com.di.crud.dto.ReplyDto;

@Service
public class HomeService {

	@Autowired
	private HomeDao dao;

	// member
	/* 로그인 */
	public MemberDto memberLogin(String mail) {
		return dao.memberLogin(mail);
	}
	/* 회원 가입 */
	public int memberSign(MemberDto md) {
		return dao.memberSign(md);
	}
	/* 이메일 중복검사*/
	public int memberMail(String mail) {
		return dao.memberMail(mail);
	}
	/* 회원정보 수정 */
	public int memberUpdate(MemberDto md) {
		return dao.memberUpdate(md);
	}
	/* 비밀번호 수정 */
	public int memberMpwUpdate(int mno) {
		return dao.memberMpwUpdate(mno);
	}
	/* 회원 탈퇴*/
	public int memberDelete(int mno) {
		return dao.memberDelete(mno);
	}
	
	// 게시판
	/* 게시판 수 가져오기 */
	public int getBoardTotal(BoardDto BoardDto) {
		return dao.getBoardTotal(BoardDto);
	}
	/* 게시판 리스트 가져오기 */
	public List<BoardDto> Boardlist(BoardDto BoardDto) {
		return dao.BoardList(BoardDto);
	} 
	/* 게시판 페이지보기 */
	public List<BoardDto> Boardview(int bno) {
		return dao.BoardView(bno);
	}
	/* 게시판 쓰기 */
	public int BoardAdd(BoardDto BoardDto) {
		return dao.BoardAdd(BoardDto);
	}
	/* 게시판 수정 가져오기 */
	public BoardDto BoardUpdateSelect(int bno) {
		return dao.BoardUpdateSelect(bno);
	}
	/* 게시판 수정 완료 */
	public int BoardUpdate(BoardDto BoardDto) {
		return dao.BoardUpdate(BoardDto);
	}
	/* 게시판 삭제 */
	public int BoardDelete(int bno) {
		return dao.BoardDelete(bno);
	}
	/* 게시물 카운트 +1 */
	public int BoardCountPlus(int bno) {
		return dao.BoardCountPlus(bno);
	}
	
	
	// 댓글
	/* 댓글 작성 */
	public int ReplyAdd(ReplyDto ReplyDto) {
		return dao.ReplyAdd(ReplyDto);
	}
	/* 댓글 가져오기 */
	public List<ReplyDto> ReplyList(int bno) {
		return dao.ReplyList(bno);
	} 
	
}
