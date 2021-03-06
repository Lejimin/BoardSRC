package controller.board;

import java.io.PrintWriter;
import java.util.Vector;

import controller.Controller;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.BoardService;
import vo.BoardVO;
import vo.ReplyVO;

public class BoardReplylistController implements Controller{

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//파라미터(게시물 번호 받기)
		HttpSession session = req.getSession();
		BoardVO boardvo = (BoardVO)session.getAttribute("BoardVO");
		
		
		//서비스실행(reply_tbl에 게시물번호에 해당되는 행들을 가지고와야함)
		BoardService service = BoardService.getInstance();
		Vector<ReplyVO> list = service.getReplyList(boardvo.getNum());
		
		try {
			PrintWriter out = resp.getWriter();
			out.print("<div class=\"row m-4\">"); 
			for(int i=0;i<list.size();i++) {
				out.print("<div class=\"row m-4\">");
				out.print("<div class=\"col-1\"  ><img style=\"width:48px;height:48px;border-radius:25%;\" src=\"/resources/img/person-circle.svg\"></div>");
				out.print("<div class=\"col-11\">");
				out.print("<div style=\"font-weight:500;font-size:20px;margin-bottom:5px;\">"+list.get(i).getWriter()+"</div>");
				out.print("<div>"+list.get(i).getComment()+"</div>");
				out.print("</div>");
				out.print("</div>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	

	}

}
