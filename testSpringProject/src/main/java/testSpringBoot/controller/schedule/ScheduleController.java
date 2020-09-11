package testSpringBoot.controller.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import testSpringBoot.command.DateCommand;
import testSpringBoot.service.schedule.DateService;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	@Autowired
	DateService dateService;
	
	@RequestMapping("schedule")
	public String form(DateCommand dateCommand, Model model) {
		dateService.execute(dateCommand, model);
		return "thymeleaf/schedule/schedule";
	}
}
