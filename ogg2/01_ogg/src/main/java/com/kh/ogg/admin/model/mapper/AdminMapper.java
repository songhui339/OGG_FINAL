package com.kh.ogg.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.ogg.admin.model.vo.Answer;
import com.kh.ogg.admin.model.vo.Notice;
import com.kh.ogg.admin.model.vo.Question;

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


}
