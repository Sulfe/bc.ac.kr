package jp.co.bbreak.sokusen._1._2;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class parseHyphenFromCSV {
	private static final DateTimeFormatter DATE_PATTERN = DateTimeFormatter.ofPattern("dd-MM-yyyy");

	private BankTransaction parseFromCSV(final String line) {
		final String line_fix = line.replaceAll("\"", "");
		final String dateColumns = line_fix.substring(0, 10);
		final String column = line_fix.replaceAll(dateColumns, "");
		final String key = column.substring(1,2);
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

	public List<BankTransaction> parseLinesFromCSV(final List<String> lines) {
		final List<BankTransaction> bankTransactions = new ArrayList<>();
		for (final String line : lines) {
			bankTransactions.add(parseFromCSV(line));
		}
		return bankTransactions;
	}
}
