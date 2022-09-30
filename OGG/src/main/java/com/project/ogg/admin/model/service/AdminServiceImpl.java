package com.project.ogg.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.admin.model.mapper.AdminMapper;
import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.Notice;
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
	public int deleteNotice(int no) {
		return mapper.deleteNotice(no);
	}

	@Override
	public int getQuestionCount() {
		// TODO Auto-generated method stub
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

}
