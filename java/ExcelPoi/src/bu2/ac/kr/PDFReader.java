package bu2.ac.kr;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.pdfbox.pdfparser.PDFParser;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.util.PDFTextStripper;

public class PDFReader {
	
	public static void main(String args[]) {
		System.out.println("start!");
		PDFReader pdfr = new PDFReader();

		try {
			String text = pdfr.read();  
			System.out.println(text);
		} catch (Exception e) {
			System.out.println("exception : " + e);

		}

	}
	
	public String read() throws Exception { 

		System.out.println("111");  

		InputStream in = new FileInputStream(new File("C:\\Users\\BON210\\Downloads\\test.pdf"));  

		String result = null;

		PDFParser pdfp = new PDFParser(in);

		pdfp.parse();

		PDDocument pdd = pdfp.getPDDocument(); 

		PDFTextStripper pdfts = new PDFTextStripper(); 

		PDDocumentInformation pddi = pdd.getDocumentInformation(); 

		System.out.println("총 페이지수 : " + pdd.getNumberOfPages()); 

		System.out.println("제목 : " + pddi.getTitle());  
		System.out.println("부제목 : " + pddi.getSubject()); 

		System.out.println("작성자 : " + pddi.getAuthor()); 

		System.out.println("작성기간 : " + pddi.getCreator());

		pdfts.setLineSeparator("\n");

		pdfts.setWordSeparator(" ");

		result = pdfts.getText(pdd);

		pdd.close();

		return result;

	}

}