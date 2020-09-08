package testSpringBoot.controller.library;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import testSpringBoot.command.LibraryBoardCommand;
import testSpringBoot.service.libraryBoard.LibraryBoardService;

@Controller
@RequestMapping("libraryBoard")
public class LibraryController {
	@Autowired
	LibraryBoardService libraryBoardService;
	// command객체가 필요한 곳에 model로 전달
	@ModelAttribute
	LibraryBoardCommand setLibraryBoardCommand() {
		return new LibraryBoardCommand();
	}
	// 방법1 model.addAttribute("LibraryBoardCommand", new LibraryBoardCommand())
	// 방법2 @ModelAttribute("LibraryBoardCommand") LibraryBoardCommand libraryBoardCommand
	@RequestMapping("library")
	public String libraryList() {
		return "lib_Board/lib_board_list";
	}
	
	@RequestMapping(value="libBoardForm", method = RequestMethod.GET)
	public String libraryWrite(/*LibraryBoardCommand libraryBoardCommand*/) {
								// 이렇게 생성하기 대신에 위에 modelattribute로 만들어줌
		return "thymeleaf/lib_Board/lib_board_write";
	}
	
	@RequestMapping(value="libBoardForm", method = RequestMethod.POST)
	public String libraryWritePro(@Validated LibraryBoardCommand libraryBoardCommand,
								BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			System.out.println("libWritePro오류");
			return "thymeleaf/lib_Board/lib_board_write";			
		}
		
		// 리스트 페이지로 가기 전에 먼저 DB에 저장
		String location = libraryBoardService.writePro(libraryBoardCommand, request); 
		// write페이지가 실행된 후에는 리스트 페이지로 가야한다.
		return location;
		
	}
}
