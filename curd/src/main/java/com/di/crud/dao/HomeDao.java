package com.di.crud.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.di.crud.dto.BoardDto;
import com.di.crud.dto.MemberDto;
import com.di.crud.dto.ReplyDto;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	// member
	/* 로그인 */
	public MemberDto memberLogin(String mail) {
		return sst.selectOne("memberXML.memberLogin", mail);
	}
	/* 회원 가입 */
	public int memberSign(MemberDto md) {
		return sst.insert("memberXML.memberSign", md);
	}
	/* 이메일 중복검사*/
	public int memberMail(String mail) {
		return sst.selectOne("memberXML.memberMail", mail);
	}
	/* 회원정보 수정 */
	public int memberUpdate(MemberDto md) {
		return sst.update("memberXML.memberUpdate", md);
	}
	/* 비밀번호 수정 */
	public int memberMpwUpdate(int mno) {
		return sst.update("memberXML.memberMpwUpdate", mno);
	}
	/* 회원 탈퇴*/
	public int memberDelete(int mno) {
		return sst.update("memberXML.memberDelete", mno);
	}
	
	// board
	/* 게시판 수 가져오기 */
	public int getBoardTotal(BoardDto BoardDto) {
		return sst.selectOne("boardXML.getBoardTotal", BoardDto);
	}
	/* 게시판 리스트 가져오기 */
	public List<BoardDto> BoardList(BoardDto BoardDto) {
		return sst.selectList("boardXML.BoardList", BoardDto);
	}
	/* 게시판 페이지보기 */
	public List<BoardDto> BoardView(int bno) {
		return sst.selectList("boardXML.BoardView", bno);
	}	
	/* 게시판 작성 */
	public int BoardAdd(BoardDto BoardDto) {
		return sst.insert("boardXML.BoardAdd", BoardDto);
	}
	/* 게시판 수정 가져오기 */
	public BoardDto BoardUpdateSelect(int bno) {
		return sst.selectOne("boardXML.BoardUpdateSelect", bno);
	}
	/* 게시판 수정 완료 */
	public int BoardUpdate(BoardDto BoardDto) {
		return sst.update("boardXML.BoardUpdate", BoardDto);
	}
	/* 게시판 삭제 */
	public int BoardDelete(int bno) {
		return sst.update("boardXML.BoardDelete", bno);
	}
	/* 게시물 카운트 +1 */
	public int BoardCountPlus(int bno) {
		return sst.update("boardXML.BoardCountPlus", bno);
	}
	
	// 댓글
	/* 댓글 작성 */
	public int ReplyAdd(ReplyDto ReplyDto) {
		return sst.insert("replyXML.ReplyAdd", ReplyDto);
	}
	/* 댓글 가져오기 */
	public List<ReplyDto> ReplyList(int bno) {
		return sst.selectList("replyXML.ReplyList", bno);
	}
	
}
