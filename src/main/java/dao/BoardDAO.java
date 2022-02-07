package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.BoardVO;

public class BoardDAO {

	//멤버변수 DataSource 관련 참조변수
		Context initCtx;
		Context envCtx;
		DataSource ds;
		
		//멤버변수 SQL 쿼리 관련 참조변수
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		
		//싱글톤 패턴 시작
		private static BoardDAO instance = new BoardDAO();
		private BoardDAO() {
			try {
			initCtx = new InitialContext();
			envCtx = (Context)initCtx.lookup("java:comp/env");
			ds = (DataSource)envCtx.lookup("jdbc/MysqlDB");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public static BoardDAO getInstance() {
			if(instance==null) {
				instance = new BoardDAO();
			}
			return instance;
		}
		//싱글톤 패턴 끝
		
		
		//게시물 읽어오기(start,end)
		public Vector<BoardVO> getBoardList(int start, int end){
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			Vector<BoardVO> list = new Vector();
			
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement("select * from board_tbl order by num desc limit ?,?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rs = pstmt.executeQuery();
				
				if(rs!=null) {
					while(rs.next()) {
						//읽어온 테이블 각행의 값을 BoardVO로 저장
						BoardVO vo = new BoardVO(
							rs.getInt("num"),
							rs.getString("email"),
							rs.getString("pwd"),
							rs.getString("subject"),
							rs.getString("content"),
							rs.getString("regdate"),
							rs.getString("ip"),
							rs.getInt("count"),
							rs.getString("filename"),
							rs.getInt("filesize")
						);
						//리스트에 넣기
						list.add(vo);
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try{rs.close();}catch(Exception e) {}
				try{pstmt.close();}catch(Exception e) {}
				try{conn.close();}catch(Exception e) {}
			}
			//service로 리턴
			return list;
		}
		
		
		
		//전체 게시물 개수 받아오기()
		public int getTotalCount(){
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int cnt=0;
			try {
				conn=ds.getConnection();
				pstmt=conn.prepareStatement("select count(*) from board_tbl ");  //count(*) = 1000개
				rs = pstmt.executeQuery();
				
				if(rs!=null) {
					while(rs.next()) {
						cnt=rs.getInt(1);
					}
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try{rs.close();}catch(Exception e) {}
				try{pstmt.close();}catch(Exception e) {}
				try{conn.close();}catch(Exception e) {}
			}
			//service로 리턴
			return cnt;
		}
}
