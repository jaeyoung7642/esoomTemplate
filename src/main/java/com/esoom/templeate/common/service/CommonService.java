package com.esoom.templeate.common.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;



public interface CommonService {
	public String filesave(MultipartFile file) throws Exception;
	public String filesave(MultipartFile file,String filePathTail) throws Exception;
	public Map<String,Object> fileUpload(MultipartFile file,String filePathTail) throws Exception;
	public Map<String,Object> fileUpload(MultipartFile file) throws Exception;
	
}
