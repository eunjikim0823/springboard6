package content;

//@Autowired
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
//어노테이션과 연관된 클래스.인터페이스 불러오게 되어있다.
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

//public class ListActionController implements Controller {
@Controller
public class GetController {

	BoardDAO dao;// BoardDAO dao=new BoardDAO();

	@Required
	@Autowired
	public void setDao(BoardDAO dao) { // <property name="dao"></property>
		this.dao = dao;
		System.out.println("setDao()호출됨(dao)=>" + dao);
	}

	@GetMapping("/registDraft")
	public void registDraft(Model model) {
		model.addAttribute("getPopList", dao.getPopList());
		System.out.println("ListActionController의 getPopList()호출됨");
	}
	}

