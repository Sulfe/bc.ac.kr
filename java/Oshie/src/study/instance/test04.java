package study.instance;

public class test04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String text = "\"05-02-2017\"-\"-30\"-Cinema";
		String text_pix = text.replaceAll("\"", "");
		String when = text_pix.substring(0, 10);

		String where = text_pix.replaceAll(when, "");

		String[] result = where.split("-(?=[A-Za-z-]|\\d+-\\d)");

		/*
		 * for(String i : result) { System.out.println(i); }
		 */

		String text02 = "\"01-02-2017\"-6000-Salary";
		String text02_pix = text02.replaceAll("\"", "");
		String when02 = text02_pix.substring(0, 10);

		String where02 = text02_pix.replaceAll(when02, "");

		System.out.println(where02);

		System.out.println(where02.substring(1, 2));

		String[] result02 = where02.split("-");

		for (String i : result02) {
			System.out.println(i);
		}

	}

}
