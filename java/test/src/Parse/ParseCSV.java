package Parse;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ParseCSV { // csv파일의 데이터 처리를 담당하는 클래스 csv관련 추가적 유지보수 기능을 설정하려면 이 클래스에서 작성하면 된다.

	private static final DateTimeFormatter DATE_PATTERN = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	private static final String[] csvSimbol = { "-", "," };

	private BankTransaction parseCSV(String s, String line) { // csv파일의 구분자와 내용을 매개변수로 하여 데이터를 나눔
		if (s.equals(",")) {
			final String[] columns = line.split(",");
			final LocalDate date = LocalDate.parse(columns[0], DATE_PATTERN);

			final double amount = Double.parseDouble(columns[1]);

			final String description = columns[2];

			return new BankTransaction(date, amount, description);
		} else if (s.equals("-")) {
			final String line_fix = line.replaceAll("\"", "");

			final String dateColumns = line_fix.substring(0, 10);

			final String column = line_fix.replaceAll(dateColumns, "");
			final String key = column.substring(1, 2);
			final String[] columns;
			if (key.equals("-")) {
				columns = column.split("-(?=[A-Za-z-]|\\d+-\\d)");
			} else {
				columns = column.split("-");
			}

			final LocalDate date = LocalDate.parse(dateColumns, DATE_PATTERN);

			final double amount = Double.parseDouble(columns[1]);

			final String description = columns[2];

			return new BankTransaction(date, amount, description);
		}
		return null;

	}

	private static boolean equals(String s) {
		for (String i : csvSimbol) {
			if (i.equals(s)) {
				return true;
			}
		}
		return false;
	}

	public List<BankTransaction> lineFromCSV(final List<String> lines, String s) {
		if (equals(s)) {

			final List<BankTransaction> bankTransactions = new ArrayList<>();
			for (final String line : lines) {
				bankTransactions.add(parseCSV(s, line));
			}
			return bankTransactions;
		} else {
			System.out.println("지원하지 않는 구분자 입니다.");
		}
		return null;
	}
}