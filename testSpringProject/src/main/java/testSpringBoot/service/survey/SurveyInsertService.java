package testSpringBoot.service.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import testSpringBoot.command.AuthInfo;
import testSpringBoot.command.SurveyCommand;
import testSpringBoot.domain.OptionsDTO;
import testSpringBoot.domain.QuestionDTO;
import testSpringBoot.mapper.SurveyMapper;

@Component
@Service
public class SurveyInsertService {
	@Autowired
	SurveyMapper surveyMapper;

	public void surveyInsert(SurveyCommand surveyCommand, HttpSession session) throws Exception{
		String userId = ((AuthInfo)session.getAttribute("authInfo")).getId();
		// 문제가 하나 일때
		QuestionDTO qdto = new QuestionDTO();
		qdto.setQuestionTitle(surveyCommand.getQuestion());
		qdto.setUserId(userId);
		
		surveyMapper.questionInsert(qdto);
		// question을 저장되거 나서 questionNum를 받아오기 위해 쿼리문 실행
		int questionNum = surveyMapper.questionNum(userId);
		
		String options [] = null;
		if(surveyCommand.getOptions() != null) {
			options = surveyCommand.getOptions().split("`");
		}
		int optionsNum = 1;
		// 문항은 1개 이상
		if(options != null) {
			// n개 만큼 문항이 저장이 되도록 반복구문 사용
			for (String optionName : options) {
				OptionsDTO odto = new OptionsDTO();
				odto.setQuestionNum(questionNum);
				odto.setOptionName(optionName);
				odto.setOptionNum(optionsNum++);	// option번호를 option만큼 1씩 증가
				odto.setUserId(userId);
				surveyMapper.optionInsert(odto);
			}
		}
		
	}
	
	
}
