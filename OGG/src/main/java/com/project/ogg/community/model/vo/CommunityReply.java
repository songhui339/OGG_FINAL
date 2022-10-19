package com.project.ogg.community.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommunityReply {
	private int cr_communityNo; // 커뮤니티 글번호 (COMMUNITY 테이블의 c_no)
	private int cr_no; // 댓글 번호
	private int cr_writerNo; // 댓글 작성한 회원 번호 (MEMBER 테이블의 m_no)
	private String cr_content; // 댓글 내용
	private String cr_status; // 댓글 상태 (Y:노출 / N:비노출)
	private Date cr_writeDate; // 댓글 작성일자
	private Date cr_modifyDate; // 댓글 수정일자
	
	private String m_nickname; // 닉네임
}