<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>
    <link href="css/Contents.css" rel="stylesheet">
<%@ page import="java.util.*,content.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--  ======================= -->
	<nav id="Contents_Board">
		<div class="row">
			<div class="col-md-8 col-sm-8">

				<select title="" onchange="window.open(value,'_self');">
				    <option value="freeBoard.html" selected>이동1</option>
				       <option value="freeBoard.html" >이동1</option>
				    <option value="Main.do">이동2</option>
				</select>


 				 <select name="type" class="type"  onchange="window.open(value,'_self');">
				  		<option selected value hidden class="type">조회기준</option>
				  		<option value="getPopList.do" class="인기순">인기순</a></option>
				  		<option value="list.do" class="최신순">최신순</option>
				  	</select>

			  		<select name="searchType" class="searchType">
				  		<option selected value hidden class="searchType">주거형태</option>
				  		<option value="아파트" class="아파트">아파트</option>
				  		<option value="빌라&연립" class="빌라&연립">빌라&연립</option>
				  		<option value="오피스텔" class="오피스텔">오피스텔</option>
				  		<option value="주택" class="주택">주택</option>
				  	</select>

				  	<select name="searchHsize" class="searchHsize">
				  		<option selected value hidden class="searchHsize">평수</option>
				  		<option value="10평 이하" class="10평 이하">10평 이하</option>
				  		<option value="10평" class="10평">10평</option>
				  		<option value="20평" class="20평">20평</option>
				  		<option value="30평" class="">30평</option>
				  	</select>

				  	<select name="searchMate" class="searchMate">
				  		<option selected value hidden class="searchMate">거주형태</option>
				  		<option value="싱글라이프" class="싱글라이프">싱글라이프</option>
				  		<option value="신혼부부" class="신혼부부">신혼부부</option>
				  		<option value="아이가 있는 집" class="아이가 있는 집">아이가 있는 집</option>
				  		<option value="부모님과 함께 사는 집" class="부모님과 함께 사는 집">부모님과 함께 사는 집</option>
				  	</select>

			</div><!--col-md-6 col-sm-6-->



			<div class="col-md-4 col-sm-6 text-right">
				<form action="search.do">
			   		<select name="searchName" size="1">
		          		<option value="author">작성자</option>
		   	      		<option value="title">제목</option>
		          		</select>

			   		<input type="text" name="searchValue">
			   		<input type="submit" value="검색">

				</form>

				 <a href="write.jsp" class="btn btn-danger icon3" role="button">글작성</a>
			</div><!--col-md-6 col-sm-6-->
		</div><!--row  -->
	</nav>

		<hr/>

			<%
			ArrayList getPopList = (ArrayList) request.getAttribute("getPopList");//${list}
			if (getPopList != null) {//데이터가 존재한다면
				Iterator iter = getPopList.iterator();
				while (iter.hasNext()) {//꺼낼 데이터가 존재한다면
					//Board data=(Board)iter.next();//Object ->(Board)형변환
					BoardCommand data = (BoardCommand) iter.next();
					//-------------------------------------------------------
					int num = data.getNum();
					String title = data.getTitle();
					String author = data.getAuthor();
					String hsize = data.getHsize();
					String mate = data.getMate();
					String type = data.getType();
					//String writeday=data.getDate();//날짜출력 ->10글자뿐만 출력하라
					String writeday = data.getWriteday();
					//------------------------------------------------
					int readcnt = data.getReadcnt();//조회수
			%>


			<!-- https://ohou.se/projects/30967/detail	 -->

				<!-- <div class="row"> -->
						<div class="col-md-4 col-sm-4">
						    <article class="content">

						    	&nbsp; &nbsp;&nbsp;
						    	조회수:<%=readcnt%>
								&nbsp; &nbsp;&nbsp;&nbsp;
						    	작성날짜:<%=writeday.substring(0, 10)%>

						<%--       <a href="retrieve.do?num=<%=num%>"> --%>
						      <a href="watch.do?num=<%=num%>">

						            <div class="thumbnail">
						              <img src="picture/인기게시물/이미지3.jpg" alt="1" class="img-rounded img-responsive">
						            <%-- 	<%=filename%> --%>
						            </div><!-- content_img -->

						            <div class="text">
						              <%=title%>
						            </div><!-- text -->

						       </a>

					            <div class="content_writer">
					               <%=author%>
					            </div><!-- content_writer -->

						       <div class="style_tag">
							       <hr>
							      <%=hsize%> &nbsp;&nbsp; <%=mate%> &nbsp;&nbsp; <%=type%>
							       <hr/>
						       </div><!-- style_tag -->
						    </article><!-- content -->
						</div><!-- class="col-md-4 col-sm-4" -->

				<!-- </div>	 -->

				<%
				} //end while
				} //end if
				%>


<script>

 $(document).ready(function(){
	 $('.type').on('change',function(){
		// alert(this.value);
		 alert($(".type option:selected").val())
	 });

 });

</script>



<%@include file ="footer.jsp" %>