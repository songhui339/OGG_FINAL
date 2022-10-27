package com.project.ogg.admin.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.OttAdmin;
import com.project.ogg.admin.model.vo.OttForPie;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.admin.model.vo.UsingOtt;
import com.project.ogg.member.model.vo.Member;

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

	List<OttAdmin> getOTTList();
	
	int addOTT(OttAdmin ott);

	int getFebUserCount();

	int getMayUserCount();

	int getAugUserCount();

	int getOctUserCount();

	int deleteOtt(int no);

	MemberAD selectMember(String memberid);

	List<OttForPie> getPieList();

	int getPartyCount();

	List<UsingOtt> selectOtt(String memberId);

}
