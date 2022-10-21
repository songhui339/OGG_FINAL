package com.project.ogg.mypage.model.service;

import java.util.List;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.OttAdmin;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.vo.Community;

public interface MypageService {

	int getQuestionCount(int no);

	List<Question> getQuestionList(PageInfo pageInfo, int no);

	Question getQuestionView(int no);

	Answer getAnswer(int q_no);

	int writeQuestion(Question question);

	int updateQuestion(Question question);


	int getCommnityCount(int m_no);

	List<Community> getCommunityList(int m_no, PageInfo pageInfo);

	int getNoticeCount();

	List<Notice> getNoticeList(PageInfo pageInfo);

	Notice getNoticeView(int no);

}
