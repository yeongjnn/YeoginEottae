package com.party.controller.member;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//SHA256 알고리즘을 사용한 해시함수
public class PwEncoding {

	// SHA-256으로 해싱하는 메소드
	public static String sha256(String msg) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(msg.getBytes());

		return bytesToHex(md.digest());

	}

	// 바이트를 헥스값으로 변환
	public static String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}

	// 1. 메시지 다이제스트를 문자열로 return
	public static String ShaEncoder(String userPw) {
		try {
			// 알고리즘을 "SHA-256"으로 하여 MessageDigest 객체 생성
			MessageDigest digest = MessageDigest.getInstance("SHA-256");

			// 해시된 데이터는 바이트 배열의 바이너리 데이터이다.
			byte[] hash = digest.digest(userPw.getBytes(StandardCharsets.UTF_8));

			StringBuilder hexString = new StringBuilder();
			// 바이트 배열을 16진수(hex) 문자열로 변환
			for (byte b : hash) { // hash에서 데이터를 꺼내 b에 담는다.
				// byte 8비트 ->int 32bit 형변환 시 앞의 18비트가 19번째 비트와 같은 값으로 채우는데
				// 이 경우에 원본 값과 다른 경우가 되는 것을 방지하기 위한 연산이다.
				String hex = Integer.toHexString(0xff & b);

				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}

	// 2. 메시지 다이제스트를 바이트 배열로 return
	public static byte[] shaEncoderByte(String message) {
		// 이 메소드는 바이트배열을 16진수 문자열로 변환하지 않음
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(message.getBytes(StandardCharsets.UTF_8));
			return hash;
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
}
