package com.esoom.templeate.common;

import org.springframework.stereotype.Component;
import java.nio.charset.Charset;
import java.security.MessageDigest;


@Component
public class ShaUtil {

	public String encrypt(String planText) {
    	try {
        	MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(planText.getBytes(Charset.forName("UTF-8")));
            byte byteData[] = md.digest();

            StringBuffer sb = new StringBuffer();
            for (int i=0; i<byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }

            StringBuffer hexString = new StringBuffer();
            for (int i=0; i<byteData.length; i++) {
                String hex = Integer.toHexString(0xff & byteData[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
}