package kw18.team.function;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kw18.team.controller.UserController;
import kw18.team.vo.GradeVO;

public class GradeCalculation {
	//이차원 정수형 리스트 값 넣기  https://stackoverrun.com/ko/q/1216106
	Double[][] grade;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	int large_sem;
	int small_sem;
	int entire_sem;
	
	int total_credit;
	int total_major_credit;
	int total_nonmajor_credit;
	double total_major_grade;
	double total_nonmajor_grade;
	double total_grade;
	
	//index 0: 전공, 1: 비전공, 2: 전체
	double[] grade_1_1 = {0.0,0.0,0.0};
	double[] grade_1_2 = {0.0,0.0,0.0};
	double[] grade_2_1 = {0.0,0.0,0.0};
	double[] grade_2_2 = {0.0,0.0,0.0};
	double[] grade_3_1 = {0.0,0.0,0.0};
	double[] grade_3_2 = {0.0,0.0,0.0};
	double[] grade_4_1 = {0.0,0.0,0.0};
	double[] grade_4_2 = {0.0,0.0,0.0};
	
	int[] credit_1_1 = {0,0,0};
	int[] credit_1_2 = {0,0,0};
	int[] credit_2_1 = {0,0,0};
	int[] credit_2_2 = {0,0,0};
	int[] credit_3_1 = {0,0,0};
	int[] credit_3_2 = {0,0,0};
	int[] credit_4_1 = {0,0,0};
	int[] credit_4_2 = {0,0,0};
	
	double[] calcfunct(double[] grade, int[] credit) {
		
		double[] ret_double = {Math.round(grade[0]/((double)credit[0])*100)/100.0,Math.round(grade[1]/((double)credit[1])*100)/100.0,Math.round(grade[2]/((double)credit[2])*100)/100.0};
		
		return ret_double;
	}
	
	double get_gradevalue(String grade) {
		if (grade.equals("A+"))
			return 4.5;
		if (grade.equals("A0"))
			return 4.0;
		if (grade.equals("B+"))
			return 3.5;
		if (grade.equals("B0"))
			return 3.0;
		if (grade.equals("C+"))
			return 2.5;
		if (grade.equals("C0"))
			return 2.0;
		if (grade.equals("D+"))
			return 1.5;
		if (grade.equals("D0"))
			return 1.0;

		return 0.0;
		
	}
	public GradeCalculation(List<GradeVO> grade_list){	
		
		String last_sem_str = grade_list.get(0).getSemester();
		large_sem = (last_sem_str.charAt(0) - '0');
		entire_sem = (last_sem_str.charAt(0) - '0')*2;
		if(last_sem_str.charAt(2) == '1') {
			small_sem = 1;
			entire_sem -= 1;
		}
		else
			small_sem = 2;

		
		for (GradeVO gradevo : grade_list) {
			
			
			if(gradevo.getCourse_info().equals("전선") || gradevo.getCourse_info().equals("전필")) {
				if(gradevo.getSemester().equals("1-1")) {
					credit_1_1[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_1_1[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("1-2")) {
					credit_1_2[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_1_2[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("2-1")) {
					credit_2_1[0] += gradevo.getCredit();
					
					if (!gradevo.getGrade().equals("P"))
						grade_2_1[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("2-2")) {
					credit_2_2[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_2_2[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("3-1")) {
					credit_3_1[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_3_1[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("3-2")) {
					credit_3_2[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_3_2[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("4-1")) {
					credit_4_1[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_4_1[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("4-2")) {
					credit_4_2[0] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_4_2[0] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}		
				
			}
		
		
			else {
				if(gradevo.getSemester().equals("1-1")) {
					credit_1_1[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_1_1[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("1-2")) {
					credit_1_2[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_1_2[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("2-1")) {
					credit_2_1[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_2_1[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("2-2")) {
					credit_2_2[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_2_2[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("3-1")) {
					credit_3_1[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_3_1[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("3-2")) {
					credit_3_2[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_3_2[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("4-1")) {
					credit_4_1[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_4_1[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}
				if(gradevo.getSemester().equals("4-2")) {
					credit_4_2[1] += gradevo.getCredit();
					if (!gradevo.getGrade().equals("P"))
						grade_4_2[1] += get_gradevalue(gradevo.getGrade())*((double)gradevo.getCredit());
				}		
				
			}
			
		}
		
		grade_1_1[2] = grade_1_1[0]+grade_1_1[1];
		grade_1_2[2] = grade_1_2[0]+grade_1_2[1];
		grade_2_1[2] = grade_2_1[0]+grade_2_1[1];
		grade_2_2[2] = grade_2_2[0]+grade_2_2[1];
		grade_3_1[2] = grade_3_1[0]+grade_3_1[1];
		grade_3_2[2] = grade_3_2[0]+grade_3_2[1];
		grade_4_1[2] = grade_4_1[0]+grade_4_1[1];
		grade_4_2[2] = grade_4_2[0]+grade_4_2[1];
		
		
		credit_1_1[2] = credit_1_1[0]+credit_1_1[1];
		credit_1_2[2] = credit_1_2[0]+credit_1_2[1];
		credit_2_1[2] = credit_2_1[0]+credit_2_1[1];
		credit_2_2[2] = credit_2_2[0]+credit_2_2[1];
		credit_3_1[2] = credit_3_1[0]+credit_3_1[1];
		credit_3_2[2] = credit_3_2[0]+credit_3_2[1];
		credit_4_1[2] = credit_4_1[0]+credit_4_1[1];
		credit_4_2[2] = credit_4_2[0]+credit_4_2[1];
		
		
		grade_1_1 = calcfunct(grade_1_1, credit_1_1);
		grade_1_2 = calcfunct(grade_1_2, credit_1_2);
		grade_2_1 = calcfunct(grade_2_1, credit_2_1);
		grade_2_2 = calcfunct(grade_2_2, credit_2_2);
		grade_3_1 = calcfunct(grade_3_1, credit_3_1);
		grade_3_2 = calcfunct(grade_3_2, credit_3_2);
		grade_4_1 = calcfunct(grade_4_1, credit_4_1);
		grade_4_2 = calcfunct(grade_4_2, credit_4_2);
 
		
	}

	public double[] getGrade_1_1() {
		return grade_1_1;
	}

	public void setGrade_1_1(double[] grade_1_1) {
		this.grade_1_1 = grade_1_1;
	}

	public double[] getGrade_1_2() {
		return grade_1_2;
	}

	public void setGrade_1_2(double[] grade_1_2) {
		this.grade_1_2 = grade_1_2;
	}

	public double[] getGrade_2_1() {
		return grade_2_1;
	}

	public void setGrade_2_1(double[] grade_2_1) {
		this.grade_2_1 = grade_2_1;
	}

	public double[] getGrade_2_2() {
		return grade_2_2;
	}

	public void setGrade_2_2(double[] grade_2_2) {
		this.grade_2_2 = grade_2_2;
	}

	public double[] getGrade_3_1() {
		return grade_3_1;
	}

	public void setGrade_3_1(double[] grade_3_1) {
		this.grade_3_1 = grade_3_1;
	}

	public double[] getGrade_3_2() {
		return grade_3_2;
	}

	public void setGrade_3_2(double[] grade_3_2) {
		this.grade_3_2 = grade_3_2;
	}

	public double[] getGrade_4_1() {
		return grade_4_1;
	}

	public void setGrade_4_1(double[] grade_4_1) {
		this.grade_4_1 = grade_4_1;
	}

	public double[] getGrade_4_2() {
		return grade_4_2;
	}

	public void setGrade_4_2(double[] grade_4_2) {
		this.grade_4_2 = grade_4_2;
	}

	public int getTotal_credit() {
		return credit_1_1[2]+credit_1_2[2]+credit_2_1[2]+credit_2_2[2]+credit_3_1[2]+credit_3_2[2]+credit_4_1[2]+credit_4_2[2];
	}

	public void setTotal_credit(int total_credit) {
		this.total_credit = total_credit;
	}

	public int getTotal_major_credit() {
		return credit_1_1[0]+credit_1_2[0]+credit_2_1[0]+credit_2_2[0]+credit_3_1[0]+credit_3_2[0]+credit_4_1[0]+credit_4_2[0];
	}

	public void setTotal_major_credit(int total_major_credit) {
		this.total_major_credit = total_major_credit;
	}

	public int getTotal_nonmajor_credit() {
		return credit_1_1[1]+credit_1_2[1]+credit_2_1[1]+credit_2_2[1]+credit_3_1[1]+credit_3_2[1]+credit_4_1[1]+credit_4_2[1];
	}

	public void setTotal_nonmajor_credit(int total_nonmajot_credit) {
		this.total_nonmajor_credit = total_nonmajot_credit;
	}

	public double getTotal_grade() {
		return (Math.round(((grade_1_1[2]*(double)credit_1_1[2]+grade_1_2[2]*(double)credit_1_2[2]
				+grade_2_1[2]*(double)credit_2_1[2]+grade_2_2[2]*(double)credit_2_2[2]
				+grade_3_1[2]*(double)credit_3_1[2]+grade_3_2[2]*(double)credit_3_2[2]
				+grade_4_1[2]*(double)credit_4_1[2]+grade_4_2[2]*(double)credit_4_2[2])/
				(double)this.getTotal_credit())*100)/100.0);
	}

	public void setTotal_grade(int total_grade) {
		this.total_grade = total_grade;
	}

	public double getTotal_major_grade() {
		return (Math.round(((grade_1_1[0]*(double)credit_1_1[0]+grade_1_2[0]*(double)credit_1_2[0]
						+grade_2_1[0]*(double)credit_2_1[0]+grade_2_2[0]*(double)credit_2_2[0]
						+grade_3_1[0]*(double)credit_3_1[0]+grade_3_2[0]*(double)credit_3_2[0]
						+grade_4_1[0]*(double)credit_4_1[0]+grade_4_2[0]*(double)credit_4_2[0])/
				(double)this.getTotal_major_credit())*100)/100.0);
	}

	public void setTotal_major_grade(double total_major_grade) {
		this.total_major_grade = total_major_grade;
	}

	public double getTotal_nonmajor_grade() {
		return (Math.round(((grade_1_1[1]*(double)credit_1_1[1]+grade_1_2[1]*(double)credit_1_2[1]
				+grade_2_1[1]*(double)credit_2_1[1]+grade_2_2[1]*(double)credit_2_2[1]
				+grade_3_1[1]*(double)credit_3_1[1]+grade_3_2[1]*(double)credit_3_2[1]
				+grade_4_1[1]*(double)credit_4_1[1]+grade_4_2[1]*(double)credit_4_2[1])/
				(double)this.getTotal_nonmajor_credit())*100)/100.0);
	}

	public void setTotal_nonmajor_grade(double total_nonmajor_grade) {
		this.total_nonmajor_grade = total_nonmajor_grade;
	}
	
	
}
