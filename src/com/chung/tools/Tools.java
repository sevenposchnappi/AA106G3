package com.chung.tools;

public class Tools {
	
	
	public String genderExchange(String gender){
		String genderExchange = "���]�w";
//		System.out.println(gender);
		if(gender != null){
			if(gender.equals("0")){genderExchange= "��";}
			if(gender.equals("1")){genderExchange= "��";}
		}
		return genderExchange;
	}
	
	public String statusExchange(String status){
		String statusExchange = "";
//		System.out.println(status);
		if(status != null){
			if(status.equals("0")){statusExchange= "�����";}
			if(status.equals("1")){statusExchange= "��@��";}
		}
		return statusExchange;
	}
	
	public String neuterExchange(String neuter){
		String neuterExchange = "���@��";
//		System.out.println(neuter);
		if(neuter != null){
			if(neuter.equals("0")){neuterExchange= "������";}
			if(neuter.equals("1")){neuterExchange= "���@��";}
		}
		return neuterExchange;
	}
	
	
}
