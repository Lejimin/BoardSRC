package service;

import java.util.Vector;

import dao.BoardDAO;
import dao.MemberDAO;
import vo.BoardVO;

public class BoardService {
	
	//멤버변수 추가
	BoardDAO dao;
	
	private static BoardService instance = new BoardService();
	private BoardService() {
		dao=BoardDAO.getInstance();
	};
	public static BoardService getinstance() {
		if(instance==null) {
			instance=new BoardService();
		}
		return instance;
	}
	
	
	
	//게시물 읽어오기(start, end)
	public Vector<BoardVO> getBoardList(int start, int end) {
		return dao.getBoardList(start, end);
	}
	
	//전체 게시물 개수 가져오기
	public int getTotalCount(){
		return dao.getTotalCount();
	}
}
