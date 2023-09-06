package com.party.controller.login;

import java.security.NoSuchAlgorithmException;

import com.party.controller.member.PwEncoding;

public class test {

	public static void main(String[] args) throws NoSuchAlgorithmException {
		//제약사항 없이 로그인하려면 str에 비밀번호 값넣고 실행결과 DB에 복붙하면 됨
		String str="Tjrwls4080!";
		
		System.out.println(PwEncoding.sha256(str));
		String a="2023/09/12 12시";
		String resDate=a.substring(2,4)+a.substring(5,7)+a.substring(8,10);
		System.out.println(resDate);
	}

}

