package testSpringBoot.controller.survey;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import testSpringBoot.command.AnsweredData;
import testSpringBoot.command.SurveyCommand;
import testSpringBoot.service.survey.SurveyInsertService;
import testSpringBoot.service.survey.SurveyService;

@Controller
@RequestMapping("survey")
public class SurveyController {
	@Autowired
	SurveyInsertService surveyInsertService;
	@Autowired
	SurveyService surveyService;
	
	@RequestMapping("surveyForm")
	public String surveyForm() {
		return "thymeleaf/survey/surveyInsert";
	}
	
	@RequestMapping("surveyInsert")
	public String surveyInsert(SurveyCommand surveyCommand, HttpSession session) throws Exception{
		surveyInsertService.surveyInsert(surveyCommand, session);
		return "redirect:/survey/surveyForm";
	}
	
	@RequestMapping("survey")
	public String form(Model model) throws Exception{
		surveyService.execute(model);
		return "thymeleaf/survey/surveyForm";
	}
	
	@RequestMapping("surveyOk")
	public String surveyOk(@ModelAttribute("ansData") AnsweredData answeredData) {
		//Model model을 받아서 사용하는 방법
		//model.addAttribute("ansData", answeredData);
		return "thymeleaf/survey/submitted"; 
	}
}
