<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="header.jsp" %>

    <!-- css 파일   -->
    <link href="css/Contents.css" rel="stylesheet">


	<!-- 글쓰기  ------------------------------------------------------------------------------->
	<div class="contents_write col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		
		<form action = "write.do" method="post"  enctype="multipart/form-data" >
					 <!-- enctype="multipart/form-data" -->
			
			<div class="form-group">
			
			    <label for="author"><h2>작성자</h2></label>
			    <input type="text" class="form-control" name="author">
				<p>
			    <label for="title"><h2>제목</h2></label>
			    <input type="text" class="form-control" placeholder="제목을 입력해주세요" name ="title">
		  		<p>
		  	</div><!-- 제목 그룹 -->
		  	
			<!-- 거주상황 표기 -->
		  	<div class="livingtype">
		  	
			  	<select name="type" class="type">
			  		<option selected value hidden class="type">주거형태</option>
			  		<option value="아파트" class="아파트">아파트</option>
			  		<option value="빌라&연립" class="빌라&연립">빌라&연립</option>
			  		<option value="오피스텔" class="오피스텔">오피스텔</option>
			  		<option value="주택" class="주택">주택</option>
			  	</select>
			  	
			  	<select name="hsize" class="hsize">
			  		<option selected value hidden class="hsize">평수</option>
			  		<option value="10평 이하" class="10평 이하">10평 이하</option>
			  		<option value="10평" class="10평">10평</option>
			  		<option value="20평" class="20평">20평</option>
			  		<option value="30평" class="">30평</option>
			  	</select>
			  	
			  	<select name="mate" class="mate">
			  		<option selected value hidden class="mate">거주형태</option>
			  		<option value="싱글라이프" class="싱글라이프">싱글라이프</option>
			  		<option value="신혼부부" class="신혼부부">신혼부부</option>
			  		<option value="아이가 있는 집" class="아이가 있는 집">아이가 있는 집</option>
			  		<option value="부모님과 함께 사는 집" class="부모님과 함께 사는 집">부모님과 함께 사는 집</option>
			  	</select> 
		  	</div>
			<p>
		  	<div class="form-group">
		  	<p>
		  		<label for="content"><h1>내용</h1></label>
		  		<textarea class="form-control summernote" rows="10" name="content" placeholder="홈꾸와 멋진 집을 공유해주세요"></textarea>
		  	
		  	</div><!-- 내용 그룹 -->
	
		  	<!-- 비밀번호 :<input type = password name = pw size=10 maxlength=10><p> -->
		  <!-- 	<input type="button" class="btn btn-warning btn-lg" value="대표사진 선택"> 	
		  	<input type="button" class="btn btn-warning btn-lg" onclick="delbtn();" value="사진 삭제"> 	 -->
	
			<input type="submit" class="btn btn-danger btn-lg" onclick="alert('글쓰기가 완료되었습니다')" value="글쓰기 완료">  
			 <a href="list.do" class="btn btn-danger btn-lg" role="button">글목록</a>
			
		</form>	    	
    </div><!--contents_write  ---------------------------------------------------------------------------------------------------------->
    
    
    
    
    
    
    
    
    
    
	<!-- 글쓰기 양식 관련 스크립트/링크 ------------------------------------------------------------------------------------------------------->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
		
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  <!--  -->
	<!-- 글쓰기 양식 폼 관련 스크립트  -->	
 	<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("file", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "./summernote_imageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
	 	        	$(editor).summernote('insertImage', data.url);
	 	        }
	 	    });
	 	}
	</script>
	 <script>
            $(document).ready(function() {
                $('.summernote').summernote({ // summernote를 사용하기 위한 선언
                    tablesize:2,
                	height: 400,
					callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor) {
						    sendFile(files[0], this);
						}
					}
				});
			});
		</script>
<%@include file ="footer.jsp" %>