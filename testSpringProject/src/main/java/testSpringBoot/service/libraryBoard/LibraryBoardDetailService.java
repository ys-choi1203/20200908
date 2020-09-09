package testSpringBoot.service.libraryBoard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import testSpringBoot.domain.FileName;
import testSpringBoot.domain.LibraryBoardDTO;
import testSpringBoot.domain.StartEndPageDTO;
import testSpringBoot.mapper.LibraryBoardMapper;

@Component
@Service
public class LibraryBoardDetailService {
	@Autowired
	LibraryBoardMapper libraryBoardMapper;
	
	public void libBoardDetail(String boardNum, HttpSession session, Model model) throws Exception{
		StartEndPageDTO startEndPageDTO = new StartEndPageDTO(1L, 1L, null, boardNum);
		LibraryBoardDTO dto = 
						libraryBoardMapper.getLibraryBoardList(startEndPageDTO).get(0);
		
		// `를 구분자가 있 는 내용을 split()을 이용하여 배열로 변환
		String [] oriFile = dto.getOriginalFileName().split("`");
		String [] strFile = dto.getStoreFileName().split("`");
		String [] fileSize = dto.getFileSize().split("`");
		
		// 배열로 저장된 파일정보를 FileName객체에 하나씩 담아 list에 저장
		List<FileName> fileList = new ArrayList<FileName>();
		int i = 0;
		for(String file : oriFile ) {
			FileName fileName = new FileName(file, strFile[i],fileSize[i] );
			fileList.add(fileName);
			i++;
		}
		model.addAttribute("fileList", fileList);
		model.addAttribute("dto", dto);
	}

}
