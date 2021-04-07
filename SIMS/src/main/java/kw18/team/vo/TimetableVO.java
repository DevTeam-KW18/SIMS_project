package kw18.team.vo;

public class TimetableVO {
	private String course_name;
	private String university;
	private String student_id;
	private String semester;
	private String course_number;
	private int credit;
	private String professor;
	private String ctime;
	private String textbook;
	private String exam_info;
	private String course_info;
	private int course_year;
	private int num_of_student;
	private String major;
	private String grade;

	private int time1;
	private int time2;
	private int time3;
	
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getCourse_number() {
		return course_number;
	}
	public void setCourse_number(String course_number) {
		this.course_number = course_number;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	///////////////////////////////
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getCtime() {
		return ctime;
	}
	
	///////time change int number
	public void setCtime(String ctime) {
		this.ctime = ctime;
		timecutter(ctime);
	}
	/////////////////////////
	public String getTextbook() {
		return textbook;
	}
	public void setTextbook(String textbook) {
		this.textbook = textbook;
	}
	public String getExam_info() {
		return exam_info;
	}
	public void setExam_info(String exam_info) {
		this.exam_info = exam_info;
	}
	public int getCourse_year() {
		return course_year;
	}
	public void setCourse_year(int course_year) {
		this.course_year = course_year;
	}
	public String getCourse_info() {
		return course_info;
	}
	public void setCourse_info(String course_info) {
		this.course_info = course_info;
	}
	public int getNum_of_student() {
		return num_of_student;
	}
	public void setNum_of_student(int num_of_student) {
		this.num_of_student = num_of_student;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	
	
	//////////////////////////////////time caculator
	public void timecutter(String ctime)
	{
		int size=ctime.length();
		String result1="",result2="",result3="";
		int num1=-1,num2=-1,num3=-1;//for saving time
		boolean check=false;
		
		if(size==4)//ex) 목7;8;
		{
			result1=ctime.substring(0,1);
			result2=result1;//요일이 같음
			num1=Integer.parseInt(ctime.substring(1,2));
			num2=Integer.parseInt(ctime.substring(3));
			
		}
		if(size==6)//ex) 금7;8;9
		{
			result1=ctime.substring(0,1);
			result2=result1;//요일이 같음
			result3=result1;//같은요일3개
			check=true;//시간이 3개
			num1=Integer.parseInt(ctime.substring(1,2));
			num2=Integer.parseInt(ctime.substring(3,4));
			num3=Integer.parseInt(ctime.substring(5));
	
		}		
		if(size==5)//ex) 월4;수3;
		{
			result1=ctime.substring(0,1);
			result2=ctime.substring(3,4);		
			num1=Integer.parseInt(ctime.substring(1,2));
			num2=Integer.parseInt(ctime.substring(4));
		}
		if(size==7)//ex) 월4;수3;4
		{
			result1=ctime.substring(0,1);
			result2=ctime.substring(3,4);
			result3=result2;
			check=true;
			num1=Integer.parseInt(ctime.substring(1,2));
			num2=Integer.parseInt(ctime.substring(4,5));
			num3=Integer.parseInt(ctime.substring(6));
		}
		
		
		
		System.out.println("요일: "+ result1 +","+ result2+","+result3);
		
						
		if(result1.equals("월"))
			num1=1+num1*6;
		if(result1.equals("화"))
			num1=2+num1*6;
		if(result1.equals("수"))
			num1=3+num1*6;
		if(result1.equals("목"))
			num1=4+num1*6;
		if(result1.equals("금"))
			num1=5+num1*6;
		if(result1.equals("토"))
			num1=6+num1*6;
		
		if(result2.equals("월"))
			num2=1+num2*6;
		if(result2.equals("화"))
			num2=2+num2*6;
		if(result2.equals("수"))
			num2=3+num2*6;
		if(result2.equals("목"))
			num2=4+num2*6;
		if(result2.equals("금"))
			num2=5+num2*6;
		if(result2.equals("토"))
			num2=6+num2*6;
		
		if(check==true)//시간이 3타임인 경우
		{
			if(result3.equals("월"))
				num3=1+num3*6;
			if(result2.equals("화"))
				num3=2+num3*6;
			if(result3.equals("수"))
				num3=3+num3*6;
			if(result3.equals("목"))
				num3=4+num3*6;
			if(result3.equals("금"))
				num3=5+num3*6;
			if(result2.equals("토"))
				num3=6+num3*6;
		}
		System.out.println("값은: "+num1+","+num2+","+num3);
		
		setTime1(num1);
		setTime2(num2);
		setTime3(num3);
	}
	//////////////////////////////////////
	public int getTime1() {
		return time1;
	}
	public void setTime1(int time1) {
		this.time1 = time1;
	}
	public int getTime2() {
		return time2;
	}
	public void setTime2(int time2) {
		this.time2 = time2;
	}
	public int getTime3() {
		return time3;
	}
	public void setTime3(int time3) {
		this.time3 = time3;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
