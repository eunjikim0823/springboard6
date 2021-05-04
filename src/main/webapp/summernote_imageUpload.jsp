<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
    // 이미지 업로드할 경로
	String uploadPath = "C:/Class/webtest/4.jsp/sou2/boardspring6/src/main/resource/upload";
    int size = 1024 * 1024 * 1024;  // 업로드 사이즈 제한 10M 이하
	
    System.out.println("1.파일 지정경로에 저장");
    
	String fileName = ""; // 파일명
	
	System.out.println("2.파일명 변경");
	
	try{
        // 파일업로드 및 업로드 후 파일명 가져옴
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String file = (String)files.nextElement(); 
		fileName = multi.getFilesystemName(file); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	System.out.println("3.파일 저장 후 가지고옴 ");
	
    // 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
	uploadPath = "/upload/" + fileName;
	
	System.out.println("4.이미지의 경로를 생성");
	
    // 생성된 경로를 JSON 형식으로 보내주기 위한 설정
	JSONObject jobj = new JSONObject();
	jobj.put("url", uploadPath);
	
	System.out.println("5.이미지의 경로 json으로 보냄");
	
	response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
	out.print(jobj.toJSONString());
	%>
