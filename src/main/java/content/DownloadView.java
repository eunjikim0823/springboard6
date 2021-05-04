package content;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//다운로드를 따로 처리해줄 수 있는 전용뷰 클래스
public class DownloadView extends AbstractView {

	public DownloadView() {
		//다운로드 받는 화면으로 전환
		setContentType("application/download");//text/html에서 변경
	}
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			                                                       HttpServletRequest request,
			                                                       HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
        //return new ModelAndView("downloadView","downloadFile",downloadFile);
		//1.다운로드 받을 파일의 정보를 얻어오기
		File file=(File)model.get("downloadFile");//Object->File
		System.out.println("file=>"+file);
		//다운받을 파일의 타입,크기를 지정
		response.setContentType(getContentType());//"application/download"
		response.setContentLength((int)file.length());//다운로드 받을 파일의 길이설정
		//브라우저별로 한글처리->User-Agent(브라우저 정보가 저장)
		String userAgent=request.getHeader("User-Agent");
		System.out.println("userAgent=>"+userAgent);//MSIE
		boolean ie=userAgent.indexOf("MSIE") > -1;//못찾으면 -1리턴
		String fileName=null;
		
		if(ie) {
			                 //1.한글이 깨질가능성있는 파일명,2.캐릭터셋 설정
			fileName=URLEncoder.encode(file.getName(),"utf-8");
		}else { //영문
			fileName=new String
					(file.getName().getBytes("utf-8"),"iso-8859-1");
		}
		//대화상자에서 원하는 위치를 다운로드 대화상자에서 지정
		//Content-Disposition=>다운로드 받는위치
		//attachment;filename=다운로드 받을  파일명(속성값)
		response.setHeader("Content-Disposition", 
				   "attachment;filename=\""+fileName+"\";");
		//exe,bat=>이진파일도 다운로드 가능하게 설정
		//Content-Transfer-Encoding 속성을 binary 지정해주면 가능
		response.setHeader("Content-Transfer-Encoding", "binary");
		//입출력객체를 만들어서 전송
		OutputStream out=response.getOutputStream();
		FileInputStream fis=null;
		try {
			fis=new FileInputStream(file);
			//서버로부터 파일을 읽어들여서 다운로드 받음->복사
			//1.다운로드 받는쪽 입력객체명 2.서버의 출력객체
			FileCopyUtils.copy(fis, out);
		}catch(IOException e) {
			e.printStackTrace();
		}finally { //예외처리와 상관없이 항상 처리해야할 기능(메모리해제)
			if(fis!=null)
				try {fis.close();}catch(IOException e) {}
		}//finally
		out.flush();//입출력->양이 될때까지 그대로 버퍼에 보관X
		               //flush()->바로 출력
	}
}




