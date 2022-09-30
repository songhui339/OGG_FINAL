package com.project.ogg.admin.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class PhotoVo {
	private MultipartFile filedata;//callback URL혻혻혻혻
	private String callback;//肄쒕갚�븿�닔??혻혻혻혻
	private String callback_func;
}
