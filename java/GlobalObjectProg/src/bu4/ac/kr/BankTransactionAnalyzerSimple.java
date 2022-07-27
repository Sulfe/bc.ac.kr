package bu4.ac.kr;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Scanner;

public class BankTransactionAnalyzerSimple {

	private static final String RESOURCES = "src/bu4/resources/"; // 파일 경로
	private static final String file_comma = "bank,data,simple.csv"; // 콤마csv파일이름
	private static final String file_hyphen = "bank-data-simple.csv"; // 하이픈 csv파일이름

	public static void main(final String... args) throws IOException {
		// TODO Auto-generated method stub

		ParseCSV pc = new ParseCSV();
		final Path path_comma = Paths.get(RESOURCES + file_comma);
		final Path path_hyphen = Paths.get(RESOURCES + file_hyphen);
		final List<String> lines_comma = Files.readAllLines(path_comma);
		final List<String> lines_hyphen = Files.readAllLines(path_hyphen);

		System.out.println(pc.lineFromCSV(lines_comma, ","));
		System.out.println(pc.lineFromCSV(lines_hyphen, "-"));

		// list for files name
		CheckResourcesFiles chf = new CheckResourcesFiles(RESOURCES); // 파일 경로를 입력받아 해당 경로의 파일관련 처리를 담당하는 객체 chf를 생성
		File fileList[] = chf.fileList(); // 파일의 목록을 얻기위해 배열 fileList 에 해당 경로의 파일 목록을 리스트로 리턴하는 함수를 사용하여 값을 입력
		System.out.println("\n" + RESOURCES + "경로의 파일 목록");
		for (File i : fileList) { // for문 반복을 통해 파일 리스트 출력
			System.out.println(i);
		}

		// Check file names
		Scanner sc = new Scanner(System.in); // 자신이 확인하고자 할 파일 명 입력받음
		System.out.println("검색/실행할 파일이름 입력");
		String fileName = sc.nextLine(); // fileName 에 입력한 문자열 저장
		sc.close(); // 사용한 스캐너 종료
		System.out.println(chf.verify(fileName)); // chf 객체의 파일 명이 있는지 확인하는 verify 메소드를 사용하여 boolean값을 출력

		// Run Program
		Runfile rf = new Runfile(); // 파일 실행 기능을 담당하는 런파일 객체 생성
		rf.run(RESOURCES + fileName); // 파일 경로와 파일 명을 입력받아 해당 경로 프로그램 실행
	}

}
