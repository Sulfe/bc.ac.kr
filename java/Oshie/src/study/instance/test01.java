package study.instance;

public class test01 {

	private String cat = "고양이"; //인스턴스 변수
	private String dog = "강아지"; //인스턴스 변수
	
	public static String rabbit = "토끼"; //클레스 변수
	public static String horse = "말"; //클레스 변수 = 스테틱 변수
	
	

	
//	클레스 안에 그냥 변수를 만드는걸 필드에다가 = 맴버 변수 > 전역 변수  / 필드
	
	

			public static void main(String[] args) {
		// TODO Auto-generated method stub

//		System.out.println(cat);
//		System.out.println(dog);
		
//		

//		System.out.println(지원.cat);
//		System.out.println(지원.dog);
		
//		System.out.println(rabbit);
//		System.out.println(horse);
		
	
		//-----------------------------------------
		
//		cat = "지원";
//		dog = "도균";
		
		test01 지원 = new test01();
		
		지원.cat = "지원";
		지원.dog = "도균";
		
		System.out.println(지원.cat);
		System.out.println(지원.dog);
		
		//------------------------------------------
		
		test01 도균 = new test01();
		
		도균.cat = "상호";
		도균.dog = "규민";
		
		System.out.println(도균.cat);
		System.out.println(도균.dog);
		
		
	}
	


}
