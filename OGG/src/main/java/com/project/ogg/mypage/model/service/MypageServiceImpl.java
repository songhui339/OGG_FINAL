package com.project.ogg.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.mypage.model.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mapper;

//	@Override
//	public List<MemberAD> getMemberList() {
//
//		return mapper.selectMemberList();
//		return null;
//	}

	@Override
	public int getQuestionCount(int no) {
		return mapper.getQuestionCount( no);
	}

	@Override
	public List<Question> getQuestionList(PageInfo pageInfo,int no) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.getQuestionList(rowBounds,no);
	}

	@Override
	public Question getQuestionView(int no) {
		Question question = mapper.getQuestionView(no);
		
		return question;
	}

	@Override
	public Answer getAnswer(int no) {

		return mapper.getAnswer(no);
	}

	@Override
	@Transactional
	public int writeQuestion(Question question) {

		return mapper.writeQuestion(question);
	}

	@Override
	@Transactional
	public int updateQuestion(Question question) {
		return mapper.updateQuestion(question);
	}

	@Override
	public int getNoticeCount() {
		return mapper.getNoticeCount();
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.selectNoticeList(rowBounds);
	}

	@Override
	public Notice getNoticeView(int no) {
		Notice notice = mapper.getNoticeView(no);
		
		return notice;
	}

	

}
