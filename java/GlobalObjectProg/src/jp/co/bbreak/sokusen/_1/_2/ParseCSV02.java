package jp.co.bbreak.sokusen._1._2;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ParseCSV02 {
	private static final DateTimeFormatter DATE_PATTERN = DateTimeFormatter.ofPattern("dd-MM-yyyy");

	public BankTransaction parseCommaFromCSV(final String line) {
		final String[] columns = line.split(",");
		final LocalDate date = LocalDate.parse(columns[0], DATE_PATTERN);

		final double amount = Double.parseDouble(columns[1]);

		final String description = columns[2];

		return new BankTransaction(date, amount, description);
	}

	public BankTransaction parseHyphenFromCSV(final String line) {
		final String[] columns = line.split("-");
		final LocalDate date = LocalDate.parse(columns[0], DATE_PATTERN);

		final double amount = Double.parseDouble(columns[1]);

		final String description = columns[2];

		return new BankTransaction(date, amount, description);
	}

	public BankTransaction parseFromCSV(final String line, final String symbol) {
		final String[] columns = line.split(symbol);
	
		final LocalDate date = LocalDate.parse(columns[0], DATE_PATTERN);

		final double amount = Double.parseDouble(columns[1]);

		final String description = columns[2];

		return new BankTransaction(date, amount, description);

	}

	public List<BankTransaction> commaLinesFromCSV(final List<String> lines) {
		final List<BankTransaction> bankTransactions = new ArrayList<>();
		for (final String line : lines) {
			bankTransactions.add(parseCommaFromCSV(line));
		}
		return bankTransactions;
	}

	public List<BankTransaction> hyphenLinesFromCSV(final List<String> lines) {
		final List<BankTransaction> bankTransactions = new ArrayList<>();
		for (final String line : lines) {
			bankTransactions.add(parseHyphenFromCSV(line));
		}
		return bankTransactions;
	}
}
