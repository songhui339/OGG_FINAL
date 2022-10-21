package com.project.ogg.mypage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.OttAdmin;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.community.model.vo.Community;

@Mapper
public interface MypageMapper {
	
	int getNoticeCount();

	List<Notice> selectNoticeList(RowBounds rowBounds);

	Notice getNoticeView(int page);

	int updateReadCount(Notice notice);

	int getQuestionCount(int no);

	List<Question> getQuestionList(RowBounds rowBounds, int no);

	Question getQuestionView(int no);

	Answer getAnswer(int no);

	int writeQuestion(Question question);

	int updateQuestion(Question question);

	int getCommnityCount(int m_no);

	List<Community> getCommunityList(int m_no, RowBounds rowBounds);


}
