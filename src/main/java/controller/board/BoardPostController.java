package controller.board;

import java.io.IOException;

import controller.Controller;
import controller.HttpUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BoardPostController implements Controller{

	//강제 재정의
	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String flag = req.getParameter("flag"); 
		if(flag.equals("true"))
		{
			//파라미터 받기
			String email = req.getParameter("email");
			String pwd = req.getParameter("pwd");
			String subject = req.getParameter("subject");
			String content = req.getParameter("content");
			//...여기서 파일업로드 처리 
			String uploadfile = req.getParameter("uploadfile");
		
			//입력값검증
			
			//서비스실행
			
			//View이동
			HttpUtil.Forward(req, resp, "/WEB-INF/View/board/post.jsp");
		}
		else
		{
			try {
				resp.sendRedirect("/Board/list.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
