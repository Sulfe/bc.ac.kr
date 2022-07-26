package bu4.ac.kr;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class ParseCSV { // csv파일의 데이터 처리를 담당하는 클래스 csv관련 추가적 유지보수 기능을 설정하려면 이 클래스에서 작성하면 된다.

	private static final DateTimeFormatter DATE_PATTERN = DateTimeFormatter.ofPattern("dd-MM-yyyy"); // csv파일 내부의 값중 날짜를
																										// localdate형으로
																										// 출력하기 위해 날짜
																										// 패턴(형식 지정)

	private BankTransaction parseCommaFromCSV(final String line) { // csv파일의 구분자 , 일때 호출하게 될 메소드
		final String[] columns = line.split(","); // 구분자 , 로 line을 나누어 배열 colums에 저장
		final LocalDate date = LocalDate.parse(columns[0], DATE_PATTERN); // , 로 나뉘어진 배열 columns에서 0번째 방에 있는 날짜 정보를 가져와
																			// datepattern에서 지정한 날짜 형식으로 localdate형의
																			// date로 저장
		final double amount = Double.parseDouble(columns[1]); // ,로 나누어진 배열 colums(String형)에서 1번째 방에 있는 입출금 내역(String형)을
																// 가져와 double형으로 변환하여 amount변수에 저장
		final String description = columns[2]; // ,로 나누어진 배역 columns에서 2번째 방에 있는 항목정보를 가져와 description변수에 저장

		return new BankTransaction(date, amount, description); // csv파일 내용을 split으로 나누어 각각의 변수에 저장한 값들을 새로운
																// BankTransaction클래스 생성자에 입력하여 입력받은 값을 초기값으로 하는 하나의 객체로
																// 리턴
	}

	private BankTransaction parseHyphenFromCSV(final String line) { // csv파일의 구분자가 - 일때 호출하게 될 메소드 .. 날짜와 음수 형식에도 -이
																	// 사용되었기 때문에 메인에서 값 출력을 확인하기 위하여 처리과정을 추가함
		final String line_fix = line.replaceAll("\"", ""); // csv파일의 구분자가 -로 되어있다면 "가 사용되어 데이터를 "데이터"처럼 감싸게되어 구분자와 데이터
															// 값을 구분할수 있도록 자동으로 문자열이 수정됨 자동적으로 붙게된 "를 제거해줌
		final String dateColumns = line_fix.substring(0, 10); // "이 제거된 문자열에서 0~10자리 글자는 날짜로 고정되어 있기 때문에 10자리를 잘라
																// dateColumns에 저장
		final String column = line_fix.replaceAll(dateColumns, ""); // "가 제거된 line_fix에서 날짜를 제거하여 입출금과 사용내역 정보만 남도록 처리
		final String key = column.substring(1, 2); // 입출금 내역의 부호가 음수인지 양수인지 판별함 - 이나 숫자가 들어가게됨
		final String[] columns;
		if (key.equals("-")) { // key값이 문자 - 와 동일하다면 --이 두개가 연속되었다는 의미
			columns = column.split("-(?=[A-Za-z-]|\\d+-\\d)"); // 정규식을 사용해 -의 전방에 영어가 있거나 음수 숫자가 있는 것 으로 split함
		} else {
			columns = column.split("-"); // 키 값이 -가 아니라면 연속되는 -이 없기 때문에 -로만 split처리함
		}

		final LocalDate date = LocalDate.parse(dateColumns, DATE_PATTERN); // 위에서 나눈 dateColumns를 date_pattern형식으로
																			// localdate형 date를 생성
		final double amount = Double.parseDouble(columns[1]); // columns의 0번째 방에는 공백이 들어가 있고 1번째 방에는 입출금 내역이 들어가있음
																// String형 리스트의 값을 double형으로 변형하여 저장
		final String description = columns[2]; // 소비 정보를 담고있는 columns 2번째 방에 있는 값으로 생성

		return new BankTransaction(date, amount, description); // 각각 나누어 저장한 값들을 bankTransaction 객체의 생성자 값으로 주어 입력한 값을
																// 초기값으로하는 하나의 객체를 생성
	}

	public List<BankTransaction> commaLinesFromCSV(final List<String> lines) { // csv에서 콤마로 구분된 csv의 값을 처리하기 위한 public
																				// 메소드
		final List<BankTransaction> bankTransactions = new ArrayList<>();
		for (final String line : lines) {
			bankTransactions.add(parseCommaFromCSV(line));
		}
		return bankTransactions;
	}

	public List<BankTransaction> hyphenLinesFromCSV(final List<String> lines) { // csv에서 하이픈으로 구분된 csv의 값을 처리하기 위한
																				// public 메소드
		final List<BankTransaction> bankTransactions = new ArrayList<>();
		for (final String line : lines) {
			bankTransactions.add(parseHyphenFromCSV(line));
		}
		return bankTransactions;
	}

}
