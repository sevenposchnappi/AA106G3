package com.chung.tools;

public class Tools {
	
	
	public String genderExchange(String gender){
		String genderExchange = "未設定";
//		System.out.println(gender);
		if(gender != null){
			if(gender.equals("0")){genderExchange= "母";}
			if(gender.equals("1")){genderExchange= "公";}
		}
		return genderExchange;
	}
	
	public String statusExchange(String status){
		String statusExchange = "";
//		System.out.println(status);
		if(status != null){
			if(status.equals("0")){statusExchange= "不顯示";}
			if(status.equals("1")){statusExchange= "顯　示";}
		}
		return statusExchange;
	}
	
	
}
