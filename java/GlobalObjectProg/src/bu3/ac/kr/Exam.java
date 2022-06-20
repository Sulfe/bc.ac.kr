package bu3.ac.kr;

import java.util.ArrayList;
import java.util.Scanner;

public class Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Exam ex = new Exam();
		ArrayList<Integer> list = new ArrayList<>();
		Scanner sc = new Scanner(System.in);
		int count = 0;
		
		System.out.println("---------------------------");
		System.out.println("       값을 입력해주세요\n  입력을 종료하려면 -1을 입력하세요");
		System.out.println("---------------------------");
		while(true) {
			try {
				int tmp = sc.nextInt();
				if(tmp == (-1)) {
					System.out.println("입력 종료됨");
					if(list.size() != 0) {
						System.out.println("리스트의 최댓값 : "+ex.max(list));
						System.out.println("리스트의 최소값 : "+ex.min(list));
					}
					break;
				} else {
					list.add(tmp);
					System.out.printf("리스트의 %d번째 값 : "+ list.get(count) + " 추가됨\n",count);
					count++;
					
				}
			} catch(Exception e) {
				System.out.println("숫자를 입력해주세요. 프로그램을 종료합니다.");
				break;
			}
		}
	}
	
	public int max(ArrayList<Integer> list) {
		int maxValue = list.get(0);
		for (int i:list) {
			if(i>maxValue) {
				maxValue = i;
			}
		}
		return maxValue;
	}
	
	public int min(ArrayList<Integer> list) {
		int minValue = list.get(0);
		for (int i:list) {
			if(i<minValue) {
				minValue = i;
			}
		}
		return minValue;
	}
}


