package Play;

import java.io.File;

import OpenFile.*;
import Parse.ParseCSV;
import Read.ReadExcel;
import Read.ReadPdf;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "src/resorces/";
		String excelFileName = "test.xlsx";
		String pefFileName = "test.pdf";

		CheckResourcesFiles crf = new CheckResourcesFiles(path);
		ParseCSV pc = new ParseCSV();
		ReadExcel re = new ReadExcel();
		ReadPdf rp = new ReadPdf();

		File fileList[] = crf.fileList(); // 파일의 목록을 얻기위해 배열 fileList 에 해당 경로의 파일 목록을 리스트로 리턴하는 함수를 사용하여 값을 입력
		System.out.println(path + "폴더의 파일 목록");
		for (File i : fileList) { // for문 반복을 통해 파일 리스트 출력
			System.out.println(i);
		}

		crf.run(path + excelFileName);

	}

}
