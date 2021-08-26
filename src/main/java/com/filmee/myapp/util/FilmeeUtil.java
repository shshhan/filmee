package com.filmee.myapp.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class FilmeeUtil {

	private static final int SALT_SIZE = 16;
	
	public static String hashing(String password, String salt) throws NoSuchAlgorithmException {
		log.debug("hashing({}, {}) invoked.", password, salt );
		MessageDigest md = MessageDigest.getInstance("SHA-256");

		password += salt;
		
		md.update(password.getBytes());
		byte[] temp = md.digest();

		String hashedPw = FilmeeUtil.byteToString(temp);
		
		log.info("hasehdPw : {}", hashedPw);
		
		return hashedPw;
		
	}// hashing

	public static String getSalt() {
		log.debug("getSalt() invoked.");
		
		SecureRandom rnd = new SecureRandom();
		byte[] temp = new byte[SALT_SIZE];
		rnd.nextBytes(temp);
		
		String salt = FilmeeUtil.byteToString(temp); 
		
		log.info("salt : {}", salt);
		
		return salt; 
		
	}//getSalt
	
	private static String byteToString(byte[] temp) {
		log.debug("byteToString(temp) invoked.");

		StringBuffer buffer = new StringBuffer();
		for (byte b : temp) {
			buffer.append(String.format("%02x", b));
		} // enhanced for

		return buffer.toString();

	}// byteToString

}// end class
