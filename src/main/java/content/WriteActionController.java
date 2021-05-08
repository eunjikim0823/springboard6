package content;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

//AbstractCommandController =>입력을 받아서 자동적으로 Setter Method 호출
//public class WriteActionController extends AbstractCommandController {
@Controller
public class WriteActionController {
      //setCommandClass(BoardCommand command)상속받아서 이미 가지고 있는 상태



	@Autowired
      BoardDAO dao;//BoardDAO dao=new BoardDAO();

	@RequestMapping("/write.do")
	protected ModelAndView test(@RequestParam("title") String title,
			                                       @RequestParam("author") String author,
			                                       @RequestParam("content") String content,
			                                       @RequestParam("hsize") String hsize,
			                                       @RequestParam("mate") String mate,
			                                       @RequestParam("type") String type,
			                                       @RequestParam("pwd") String pwd,
			                                       @RequestParam("filename") String filename
			)
			                                           throws Exception {
		// TODO Auto-generated method stub
		System.out.println("WriteActionController의 handle()호출됨");

		BoardCommand data=new BoardCommand();
		int newNum=dao.getNewNum()+1;
		data.setNum(newNum);//data.getNum() =>#{num}


		String fileName=null;
		MultipartFile uploadFile = data.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=uuid+"."+ext;
			uploadFile.transferTo(new File("D:\\upload\\" + fileName));
		}
		vo.setFileName(fileName);
		boardService.insertBoard(vo);




		//수동 => <jsp:setProperty name="객체명" property="*" />
		data.setTitle(title);
		data.setAuthor(author);
		data.setContent(content);
		data.setHsize(hsize);
		data.setMate(mate);
		data.setType(type);
		data.setPwd(pwd);
		data.setFilename(filename);
		dao.write(data);//data.getWriter() =>#{writer},,,

		System.out.println("Write content="+content);




		return new ModelAndView("redirect:/list.do");

	}

}