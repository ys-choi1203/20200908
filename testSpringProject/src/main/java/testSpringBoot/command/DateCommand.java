package testSpringBoot.command;

import lombok.Data;

@Data
public class DateCommand {
	String nYear;
	String nMonth;
	// 이전 이후를 이야기 하는것
	String action;
}
