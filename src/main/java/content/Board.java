package content;


//DTO -> 입력폼의 name와 반드시 같아야 된다. ->액션태그때문에


public class Board { //BoardDTO,BoardVO

	private int num;//게시물번호
	private String author,title,content,date;//작성자,글제목,글내용,작성일
	private int readcnt;//조회수
	

	private String hsize,mate,type;
	

	/*
	 * private String uploadPath;
	 * 
	 * public String getUploadPath() { return uploadPath; }
	 * 
	 * public void setUploadPath(String uploadPath) { this.uploadPath = uploadPath;
	 * }
	 */

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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	
	
}
