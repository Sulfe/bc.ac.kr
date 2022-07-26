package bu4.ac.kr;

import java.awt.Desktop;
import java.io.File;

public class Runfile {

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
