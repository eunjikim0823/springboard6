package content;

//BoardDTO -> 하나의 레코드에 관련된 필드와 연관이 있는 클래스
//BoardCommand=>실질적으로 사용자로부터 값을 입력받는 필드로만
//                              구성한 클래스(작성자이름,글제목,글내용) 게시물번호,조회수x
//스프링의 jsp의 action태그처럼 ->입력받은 값을 자동으로 Setter Method를 호출

public class BoardCommand {
    
	int num;
	String author,title,content;//num,date,readcnt (x)
    //추가
	String writeday;
	int readcnt;
	
	String hsize,mate,type;
	
	/*
	 * String uploadPath;
	 * 
	 * public String getUploadPath() { return uploadPath; }
	 * 
	 * public void setUploadPath(String uploadPath) { this.uploadPath = uploadPath;
	 * }
	 */
	
	//DTO와 상관이없지만 MyBatis검색때문에 필요한 클래스때문에 추가
	String searchName;//검색분야
	String searchValue;//검색어
	
	String searchType;//주거형태
	String searchHsize;//평수
	String searchMate;//거주형태
	
	
	public int getNum() { //#{num}
		System.out.println("getNum()호출됨");
		return num;
		
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getAuthor() {

		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
		}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;

	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;

	}
	public String getHsize() {
		return hsize;
	}

	public void setHsize(String hsize) {
		this.hsize = hsize;
	}

	public String getMate() {
		return mate;
	}

	public void setMate(String mate) {
		this.mate = mate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchHsize() {
		return searchHsize;
	}

	public void setSearchHsize(String searchHsize) {
		this.searchHsize = searchHsize;
	}

	public String getSearchMate() {
		return searchMate;
	}

	public void setSearchMate(String searchMate) {
		this.searchMate = searchMate;
	}

}
