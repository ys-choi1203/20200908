package testSpringBoot.controller.library;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import testSpringBoot.command.LibraryBoardCommand;
import testSpringBoot.controller.FileDownLoad;
import testSpringBoot.domain.FileName;
import testSpringBoot.service.libraryBoard.FileDelService;
import testSpringBoot.service.libraryBoard.LibBoardModifyService;
import testSpringBoot.service.libraryBoard.LibraryBoardDetailService;
import testSpringBoot.service.libraryBoard.LibraryBoardListService;
import testSpringBoot.service.libraryBoard.LibraryBoardService;

@Controller
@RequestMapping("libraryBoard")
public class LibraryController {
	@Autowired
	LibraryBoardService libraryBoardService;
	@Autowired
	LibraryBoardListService libraryBoardListService;
	@Autowired
	LibraryBoardDetailService libraryBoardDetailService;
	@Autowired
	FileDownLoad fileDownLoad;
	@Autowired
	FileDelService fileDelService;
	@Autowired
	LibBoardModifyService libBoardModifyService;
	
	// command객체가 필요한 곳에 model로 전달
	@ModelAttribute
	LibraryBoardCommand setLibraryBoardCommand() {
		return new LibraryBoardCommand();
	}
	// 방법1 model.addAttribute("LibraryBoardCommand", new LibraryBoardCommand())
	// 방법2 @ModelAttribute("LibraryBoardCommand") LibraryBoardCommand libraryBoardCommand
	@RequestMapping("library")
	public String libraryList(@RequestParam(value = "page", defaultValue = "1")	Integer page,
							Model model ) throws Exception{
		// DB로 부터 리스를 가져오기 위해서
		libraryBoardListService.libraryBoardList(model, page);
		return "lib_Board/lib_board_list";
	}
	
	@RequestMapping(value="libBoardForm", method = RequestMethod.GET)
	public String libraryWrite(/*LibraryBoardCommand libraryBoardCommand*/) {
								// 이렇게 생성하기 대신에 위에 modelattribute로 만들어줌
		return "thymeleaf/lib_Board/lib_board_write";
	}
	
	@RequestMapping(value="libBoardForm", method = RequestMethod.POST)
	public String libraryWritePro(@Validated LibraryBoardCommand libraryBoardCommand,
								BindingResult result, HttpServletRequest request) throws Exception{
		if(result.hasErrors()) {
			System.out.println("libWritePro오류");
			return "thymeleaf/lib_Board/lib_board_write";			
		}
		
		// 리스트 페이지로 가기 전에 먼저 DB에 저장
		String location = libraryBoardService.writePro(libraryBoardCommand, request); 
		// write페이지가 실행된 후에는 리스트 페이지로 가야한다.
		return location;
	}
	
	// localhost:9090/libraryBoard/libBoardDetail/289
	@RequestMapping("libBoardDetail/{id}")
	public String libBoardDetail(@PathVariable(value = "id") String boardNum,
			Model model, HttpSession session)  throws Exception{
		libraryBoardDetailService.libBoardDetail(boardNum, session, model);
		return "thymeleaf/lib_Board/lib_board_view";
	}
	
	@RequestMapping("fileDown")
	public void filDownLoad(@RequestParam(value="file")String fileName,
			HttpServletResponse response, HttpServletRequest request) throws Exception{
		String path = "/static/lib_Board/upload";
		fileDownLoad.fileDownLoad(path, fileName, request, response);
	}
	
	@RequestMapping("libBoardModify")
	public String libBoardModify(Model model, HttpSession session,
							@RequestParam(value = "boardNum") String boardNum) throws Exception{
		libraryBoardDetailService.libBoardDetail(boardNum, session, model);
		return "thymeleaf/lib_Board/lib_board_modify";
	}
	
	@RequestMapping("fileDel")
	public String fileDel(FileName fileName, HttpSession session, Model model) {
		fileDelService.fileSessionAdd(fileName, session, model);
		return "thymeleaf/lib_Board/delPage";
	}
	
	@RequestMapping(value = "libBoardModifyPro", method = RequestMethod.POST)
	public String libBoardModifyPro(LibraryBoardCommand libraryBoardCommand,
									HttpSession session, Model model) throws Exception{
		String path = libBoardModifyService.libBoardModify(libraryBoardCommand, session, model);
		
		return path; 
	}
}
