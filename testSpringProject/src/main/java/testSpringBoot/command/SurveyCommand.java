package testSpringBoot.command;

import lombok.Data;

@Data
public class SurveyCommand {
	String question;
	String options;
}
