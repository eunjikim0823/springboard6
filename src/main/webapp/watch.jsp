<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="content.*" %>   
<%@include file ="header.jsp" %>
    <!-- css 파일   -->
    <link href="css/Contents.css" rel="stylesheet"  type="text/css">

<%
  //Board data=(Board)request.getAttribute("data");//${data}
   BoardCommand data=(BoardCommand)request.getAttribute("data");//${data}
  int num=data.getNum();  //${data.num}
  String title=data.getTitle();
  String author=data.getAuthor();
  String content=data.getContent();
  String hsize = data.getHsize();
  String mate = data.getMate();
  String type = data.getType();
%>


	<!-- 글 상세보기 및 수정----------------------------------------------------------->
	<div class="row">
		<div class="contents_write col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		
			  	<div class="form-group">
		
			  		<%-- <label for="num"><h2>글번호</h2></label>
				    <input type="text" class="form-control" name ="num" value="<%= num %>"readonly="readonly"/> --%>
				    <label for="author"><h4>작성자</h4></label>
				    <input type="text" class="form-control" name="author" value="<%= author %>">
		
				    <label for="title"><h4>제목</h4></label>
				    <input type="text" class="form-control" name ="title" value="<%= title %>">
		
			  	</div><!-- 제목 그룹 --><p>
			  	
				<!-- 거주상황 표기 -->
			  	<div class="watch_livingtype">
			  	 	[<%= type %>]&nbsp; &nbsp;&nbsp;&nbsp; 
			  	 	[<%= hsize %>]&nbsp; &nbsp;&nbsp;&nbsp;
			  	 	[<%= mate %>]
			  	</div><p>
			  	
			  	<div class="watch_content">
			  		<label for="content"><h3>내용</h3></label><p>
					<%= content %><p>
				</div>	
				
				<a href="retrieve.do?num=<%= num %>" type="button" class="btn btn-danger btn-sm text-right">글수정하기</a>
	
			</form>	    	
    	</div><!--contents_write  ---------------------------------------------------------------------------------------------------------->
    </div>

	
<%@include file ="footer.jsp" %>