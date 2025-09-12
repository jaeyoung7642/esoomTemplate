package com.esoom.templeate.common.service.impl;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.esoom.templeate.common.service.CommonService;


@Service("commonService")
public class CommonServiceImpl implements CommonService {
	private static final char[] rndAllCharacters = new char[]{
	        //number
	        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	        //uppercase
	        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
	        'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	        //lowercase
	        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
	        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	        //special symbols
	        '@', '$', '!', '%', '*', '?', '&'
	};
	@Override
	public String filesave(MultipartFile file) throws Exception {
		String result = "";
		//로컬 경로
		String filePath = "C:\\eGovFrameDev-4.3.1-64bit\\workspace-esoom\\esoomTemplate\\src\\main\\webapp\\resources\\common\\images\\upload\\";
		//개발 경로
//		String filePath = "D:\\apache-tomcat-9.0.89\\upload\\";
		//운영
//		String filePath = "C:\\www\\apache-tomcat-9.0.93\\upload\\";
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(filePath + savedFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			result = savedFileName;
		} catch (Exception e) {
			// 파일삭제
			FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
			e.printStackTrace();
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	@Override
	public String filesave(MultipartFile file,String filePathTail) throws Exception {
		String result = "";
		//로컬 경로
		String filePath = "C:\\eGovFrameDev-4.3.1-64bit\\workspace-esoom\\esoomTemplate\\src\\main\\webapp\\resources\\common\\images\\upload\\";
		//개발 경로
//		String filePath = "D:\\apache-tomcat-9.0.89\\upload\\";
		//운영
//		String filePath = "C:\\www\\apache-tomcat-9.0.93\\upload\\";
		filePath = filePath +filePathTail+ "\\";
		System.out.println("filePath==================="+filePath);
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(filePath + savedFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			result = savedFileName;
		} catch (Exception e) {
			// 파일삭제
			FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
			e.printStackTrace();
			result = "false";
		}
		System.out.println(result);
		return result;
	}
	@Override
	public Map<String, Object> fileUpload(MultipartFile file,String filePathTail) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		//로컬 경로
		String filePath = "C:\\eGovFrameDev-4.3.1-64bit\\workspace-esoom\\esoomTemplate\\src\\main\\webapp\\resources\\common\\images\\upload\\";
		//개발 경로
//		String filePath = "D:\\apache-tomcat-9.0.89\\upload\\";
		//운영
//		String filePath = "C:\\www\\apache-tomcat-9.0.93\\upload\\";
		filePath = filePath +filePathTail+ "\\";
		System.out.println("filePath==================="+filePath);
		String url = "/resources/common/images/upload/"+filePathTail+"/";
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(filePath + savedFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			result.put("url", url+savedFileName);
			result.put("fileName", savedFileName);
			result.put("fileNameOrg", originalFileName);
		} catch (Exception e) {
			// 파일삭제
			FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Map<String, Object> fileUpload(MultipartFile file) throws Exception {
		Map<String,Object> result = new HashMap<String, Object>();
		//로컬 경로
		String filePath = "C:\\eGovFrameDev-4.3.1-64bit\\workspace-esoom\\esoomTemplate\\src\\main\\webapp\\resources\\common\\images\\upload\\";
		
		//개발 경로
//		String filePath = "D:\\apache-tomcat-9.0.89\\upload\\";
		//운영
//		String filePath = "C:\\www\\apache-tomcat-9.0.93\\upload\\";
		String url = "/resources/common/images/upload/";
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
		File targetFile = new File(filePath + savedFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			result.put("url", url+savedFileName);
			result.put("fileName", savedFileName);
			result.put("fileNameOrg", originalFileName);
		} catch (Exception e) {
			// 파일삭제
			FileUtils.deleteQuietly(targetFile); // 저장된 현재 파일 삭제
			e.printStackTrace();
		}
		return result;
	}
	public static String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	    }
	    return ip;
	}
}
