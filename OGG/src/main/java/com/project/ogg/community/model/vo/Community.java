package com.project.ogg.community.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Community {
	private int c_writerNo; // 작성자 회원번호 (MEMBER 테이블의 m_no)
	private int c_no; // 글 번호
	private String c_title; // 제목
	private String c_content; // 내용
	private String c_file; // 파일
	private String c_fileRename; // 파일 수정
	private Date c_writeDate; // 작성일자
	private Date c_modifyDate; // 수정일자
	private int c_viewCount; // 조회수
	private String c_status; // 글 상태 (Y:노출 / N:비노출)
	private int c_like; // 좋아요 횟수
	private int cr_replyCount;
	
	private int m_no;
	private String m_nickName;
}
