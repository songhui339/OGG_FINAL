package com.project.ogg.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.Question;

@Mapper
public interface AdminMapper {

//	List<MemberAD> selectMemberList();
	
	int getNoticeCount();

	List<Notice> selectNoticeList(RowBounds rowBounds);

	Notice getNoticeView(int page);

	int insertNotice(Notice notice);

	int updateNotice(Notice notice);

	int deleteNotice(int no);

	int updateReadCount(Notice notice);

	int getQuestionCount();

	List<Question> getQuestionList(RowBounds rowBounds);

	Question getQuestionView(int no);

	Answer getAnswer(int no);

	int insertAnswer(Answer answer);

	int updateQnA(Answer answer);

	int answerUpdate(Answer answer);

	int writeQuestion(Question question);

	List<MemberAD> getMemberList();

	int updateQuestion(Question question);


}
