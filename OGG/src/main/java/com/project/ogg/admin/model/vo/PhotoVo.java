package com.project.ogg.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhotoVo {
	private MultipartFile filedata;//callback URL    
	private String callback;//콜백함수??    
	private String callback_func;
}
