package bu2.ac.kr;

public class Calc {
	public int add(String num1, String num2) {
		int value1 = Integer.parseInt(num1);
		int value2 = Integer.parseInt(num2);
		int result = value1 + value2;
		return result;
	}

	public int sub(String num1, String num2) {
		int value1 = Integer.parseInt(num1);
		int value2 = Integer.parseInt(num2);
		int result = value1 - value2;
		return result;
	}

	public int mul(String num1, String num2) {
		int value1 = Integer.parseInt(num1);
		int value2 = Integer.parseInt(num2);
		int result = value1 * value2;
		return result;
	}

	public String div(String num1, String num2) {
		int value1 = Integer.parseInt(num1);
		int value2 = Integer.parseInt(num2);
		int result1 = value1 / value2;
		int result2 = value1 % value2;
		String result3 = "몫: " + Integer.toString(result1) + "  나머지: " + Integer.toString(result2);
		return result3;
	}
}
