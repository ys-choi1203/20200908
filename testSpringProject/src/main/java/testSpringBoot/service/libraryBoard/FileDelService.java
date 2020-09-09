package testSpringBoot.service.libraryBoard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import testSpringBoot.domain.FileName;

@Component
@Service
public class FileDelService {

	public void fileSessonAdd(FileName fileName, HttpSession session, Model model) {
		List<FileName> list = (List<FileName>)session.getAttribute("fileList");
		if(list == null) {
			list = new  ArrayList<FileName>();
		}
		
		int num = 0;
		// session이 존재하지 않으면 true, session이 존재하면 false
		Boolean newFile = true;
		for(int i = 0; i < list.size(); i++) {
			FileName fn = list.get(i);
			if(fn.getStoreFileName().equals(fileName.getStoreFileName())) {
				list.remove(i);
				newFile = false;
				num = 0;
			}
		}
		if(newFile) {
			list.add(fileName);
			num = 1;
		}
		model.addAttribute("val", num);
		session.setAttribute("fileList", list);
	}

}
