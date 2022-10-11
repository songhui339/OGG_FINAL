package com.project.ogg.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.admin.model.mapper.AdminMapper;
import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.MemberAD;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.OttAdmin;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.common.util.PageInfo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;

//	@Override
//	public List<MemberAD> getMemberList() {
//
//		return mapper.selectMemberList();
//		return null;
//	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.selectNoticeList(rowBounds);
	}

	@Override
	public int getNoticeCount() {

		return mapper.getNoticeCount();
	}

	@Override
	public Notice getNoticeView(int page) {
		Notice notice = mapper.getNoticeView(page);
		
		return notice;
	}

	@Override
	@Transactional
	public int noticeSave(Notice notice) {
		
		if(notice.getN_no() == 0) {
			return mapper.insertNotice(notice);
		}else {
			return mapper.updateNotice(notice);
			
		}
	}

	@Override
	@Transactional
	public int deleteNotice(int no) {
		return mapper.deleteNotice(no);
	}

	@Override
	public int getQuestionCount() {
		return mapper.getQuestionCount();
	}

	@Override
	public List<Question> getQuestionList(PageInfo pageInfo) {

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
        RowBounds rowBounds = new RowBounds(offset, limit);
        
		return mapper.getQuestionList(rowBounds);
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
	public int insertAnswer(Answer answer) {

		return mapper.insertAnswer(answer);
	}

	@Override
	@Transactional
	public int updateQnA(Answer answer) {
		return mapper.updateQnA(answer);
	}

	@Override
	@Transactional
	public int answerUpdate(Answer answer) {
		return mapper.answerUpdate(answer);
	}

	@Override
	@Transactional
	public int writeQuestion(Question question) {

		return mapper.writeQuestion(question);
	}

	@Override
	public List<MemberAD> getMemberList() {
		return mapper.getMemberList();
	}

	@Override
	@Transactional
	public int updateQuestion(Question question) {
		return mapper.updateQuestion(question);
	}

	@Override
	public List<OttAdmin> getOTTList() {
		return mapper.getOTTList();
	}
	
	@Override
	public int getMarchUserCount() {
		return mapper.getMarchUserCount();
	}

	@Override
	public int getJuneUserCount() {
		return mapper.getJuneUserCount();
	}

	@Override
	public int getSepUserCount() {
		return mapper.getSepUserCount();
	}

	@Override
	public int getDecUserCount() {
		return mapper.getDecUserCount();
	}

}
