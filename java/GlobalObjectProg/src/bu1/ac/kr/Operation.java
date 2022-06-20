package bu1.ac.kr;

import java.util.ArrayList;
import java.util.Scanner;
import bu2.ac.kr.*;

public class Operation {
	private String op1;
	private String op2;
	private String operator;

	public String getOp1() {
		return op1;
	}

	public void setOp1(String op1) {
		this.op1 = op1;
	}

	public String getOp2() {
		return op2;
	}

	public void setOp2(String op2) {
		this.op2 = op2;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Operation op = new Operation();
		Scanner sc = new Scanner(System.in);
		ArrayList<String> list = new ArrayList<>();
		boolean run = true;
		int count = 0;

		try {
			while (run) {
				System.out.println("----------------------------");
				System.out.println("계산할 식을 입력해주세요");
				System.out.println("예) 1+2, 1*2, 2/1, 2-1");
				System.out.println("사용 가능 연산자 : + - * /");
				System.out.println("종료를 원하시면 ESC를 입력해 주세요");
				System.out.println("----------------------------");
				String tmp = sc.nextLine();
				String newTmp = tmp.replaceAll("\\s", ""); // 공백 제거

				if (newTmp.equals("esc") || newTmp.equals("ESC")) {
					run = false;
					System.out.println("\n 프로그램 종료됨");

				} else {
					list.add(newTmp);
					op.process(list, count);
					count++;
				}
			}

		}

		catch (Exception e) {
			System.out.println("\n올바른 형식의 식이 아닙니다. 예시와 동일한 형식의 식을 입력하세요");
			System.out.println("프로그렘을 종료합니다.");
		}

	}

	public void process(ArrayList<String> list, int count) {
		Operation op = new Operation();
		Calc calc = new Calc();
		String regExp1 = "(?<=\\d)(?=\\D)|(?<=\\D)(?=\\d)";
		String expression = list.get(count);
		String[] split = expression.split(regExp1);
		op.setOp1(split[0]);
		op.setOp2(split[2]);
		op.setOperator(split[1]);

		try {
			switch (op.getOperator()) {
			case "+":
				System.out.println("\n결과: " + calc.add(op.getOp1(), op.getOp2()));
				break;
			case "-":
				System.out.println("\n결과: " + calc.sub(op.getOp1(), op.getOp2()));
				break;
			case "*":
				System.out.println("\n결과: " + calc.mul(op.getOp1(), op.getOp2()));
				break;
			case "/":
				System.out.println("\n결과: " + calc.div(op.getOp1(), op.getOp2()));
				break;
			default:
				System.out.println("\n연산자를 잘못 입력하였습니다. 다시 입력하여 주세요.");
			}
		} catch (Exception e) {
			System.out.println("\n정상적인 식을 입력해주세요.");
		}
	}

}