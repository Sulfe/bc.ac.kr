package Parse;

import java.time.LocalDate;
import java.util.Objects;

public class BankTransaction {
	private final LocalDate date;
	private final double amount;
	private final String description;

	public BankTransaction(final LocalDate date, final double amount, final String description) { // 생성자
		this.date = date;
		this.amount = amount;
		this.description = description;
	}

	public LocalDate getDate() { // date에 입력된 값을 가져오는 메소드
		return date;
	}

	public double getAmount() { // amount에 입력된 값을 가져오는 메소드
		return amount;
	}

	public String getDescription() { // description에 입력된 값을 가져오는 메소드
		return description;
	}

	@Override
	public String toString() { // 객체가 가지고 있는 정보를 문자열로 만들어 리턴하는 메소드
		return "BankTransaction{" + "date=" + date + ", amount=" + amount + ", description='" + description + '\''
				+ '}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		BankTransaction that = (BankTransaction) o;
		return Double.compare(that.amount, amount) == 0 && date.equals(that.date)
				&& description.equals(that.description);
	}

	@Override
	public int hashCode() {
		return Objects.hash(date, amount, description);
	}

}
