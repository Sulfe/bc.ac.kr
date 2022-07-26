package study.instance;

public class test03 {

	public static void main(String[] args) {
		String c = "\"01-02-2017\"-6000-Salary";
		String z = "\"05-02-2017\"-\"-30\"-Cinema";
		

		// 날짜 뽑아오기
		c = c.replaceAll("\"", "");
		System.out.println(c);
		System.out.println("------------------");
		String when = c.substring(0, 10);
		System.out.println(when);
		System.out.println("------------------");
		// 날짜 제거
		c = c.replaceAll(when, "");
		System.out.println(c);
		System.out.println("------------------");
		//나머지 배열화
		String[] payWhere = c.split("-");
		for (String i : payWhere) {
			System.out.println(i);
		}
		
		System.out.println("--------------------\n\n");
		
		//z = z.replaceAll("\"", "");
		System.out.println(z);
		System.out.println("------------------");
		String when01 = z.substring(0, 12);
		String when05 = when01.replaceAll("\"", "");
		System.out.println(when05);
		System.out.println("------------------");
		//나머지 배열화
		z = z.replaceAll(when01, "");
		System.out.println(z);
		String[] payWhere01 = z.split("-(?=[A-Za-z-]|\\d+-\\d)");
		for (String i : payWhere01) {
			System.out.println(i);
		}
	}
}
