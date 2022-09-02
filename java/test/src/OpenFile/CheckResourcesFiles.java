package OpenFile;

import java.awt.Desktop;
import java.io.File;

public class CheckResourcesFiles { //파일 경로의 처리, 파일이름 체크 를 하기 위한 클레스

	private String resources; //생성자로 받아와 초기값을 저장할 전역변수

	public CheckResourcesFiles(String resources) { //클래스 객체를 생성할 때 String resources를 입력 받아와 해당 객체의 초기값을 설정함
		this.resources = resources; //this는 자기 자신 객체를 의미함

	}

	public boolean verify(String fileName) { //입력받은 fileName에 경로가 있는지 확인하는 메소드
		final File file = new File(resources, fileName); //경로를 입력받아 파일 명과 파일 경로의 값을 지닌 객체 생성
		final boolean key = file.exists(); //file 객체가 지닌 경로와 파일명에 대하여 파일 유무를 boolean 값으로 리턴하는 exists() 매소드 호출

		return key;
	}

	public File[] fileList() { //파일 배열을 리턴하는 매소드 
		final File file = new File(resources); //해당 파일 경로를 지닌 객체 생성
		final File files[] = file.listFiles(); //해당 경로의 파일 명을 배열로 리턴해주는 매소드 실행

		return files;
	}
	
	public void run(String path) {
		try {
			File file = new File(path);
			if (!Desktop.isDesktopSupported()) {
				System.out.println("not supported");
				return;
			}
			Desktop desktop = Desktop.getDesktop();
			if (file.exists())
				desktop.open(file);
			else {
				System.out.println("파일이 없어 실행할 수 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

	


