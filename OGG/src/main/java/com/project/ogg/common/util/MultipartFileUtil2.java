package com.project.ogg.common.util;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MultipartFileUtil2 {
	public static String save(MultipartFile upfile, String location, String name) {
		String ott_thumb = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("Upfile Name : {}", originalFileName);
		log.info("location : {}", location);
		
		File folder = new File(location);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		ott_thumb = "logo_"+name;
		
		try {
			upfile.transferTo(new File(location + "/" + ott_thumb+originalFileName.substring(originalFileName.lastIndexOf("."))));
			
		} catch (IllegalStateException | IOException e) {
			log.error("파일 업로드 실패");
			e.printStackTrace();
		}
		
		return ott_thumb;
	}

	public static void delete(String location) {
		log.info("location : {}", location);
		
		File file = new File(location);
		
		if(file.exists()) {
			file.delete();
		}
	}
}
